import 'dart:async';

import 'package:dio/dio.dart';
main() async {
Dio dio = Dio();
  
  //  dio instance to request token
  Dio tokenDio = Dio();
  String xAccessToken;
  dio.options.baseUrl = "http://yapi.demo.qunar.com/mock/98814/flutter-learn/";
  tokenDio.options = dio.options;
  dio.interceptors.add(InterceptorsWrapper(onRequest: (RequestOptions options) {
    print('send request：path:${options.path}，baseURL:${options.baseUrl}');
    if (xAccessToken == null) {
      print("no token，request token firstly...");
      dio.lock();
      //print(dio.interceptors.requestLock.locked);
      return tokenDio.get("/getToken").then((d) {
        options.headers["x-access-token"] = xAccessToken = d.data['data']['token'];
        print("request token succeed, value: " + d.data['data']['token']);
        print(
            'continue to perform request：path:${options.path}，baseURL:${options.path}');
        return options;
      }).whenComplete(() => dio.unlock()); // unlock the dio
    } else {
      options.headers["x-access-token"] = xAccessToken;
      return options;
    }
  }, onError: (DioError error) {
    //print(error);
    // Assume 401 stands for token expired
    if (error.response?.statusCode == 401) {
      RequestOptions options = error.response.request;
      // If the token has been updated, repeat directly.
      if (xAccessToken != options.headers["x-access-token"]) {
        options.headers["x-access-token"] = xAccessToken;
        //repeat
        return dio.request(options.path, options: options);
      }
      // update token and repeat
      // Lock to block the incoming request until the token updated
      dio.lock();
      dio.interceptors.responseLock.lock();
      dio.interceptors.errorLock.lock();
      return tokenDio.get("/token").then((d) {
        //update xAccessToken
        options.headers["x-access-token"] = xAccessToken = d.data['data']['token'];
      }).whenComplete(() {
        dio.unlock();
        dio.interceptors.responseLock.unlock();
        dio.interceptors.errorLock.unlock();
      }).then((e) {
        //repeat
        return dio.request(options.path, options: options);
      });
    }
    return error;
  }));

  _onResult(d) {
    print("request ok!");
  }

  // await Future.wait([
  //   dio.get("/test?tag=1").then(_onResult),
  //   dio.get("/test?tag=2").then(_onResult),
  //   dio.get("/test?tag=3").then(_onResult)
  // ]);
}