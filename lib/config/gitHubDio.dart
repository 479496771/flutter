import 'dart:io';
import 'package:dio/dio.dart';

main() async {
  var dio = Dio();
  dio.options
    ..baseUrl = "http://yapi.demo.qunar.com/mock/98814/flutter-learn/"
    ..connectTimeout = 5000 //5s
    ..receiveTimeout = 5000
    ..validateStatus = (int status) {
      return status > 0;
    }
    ..headers = {
      HttpHeaders.userAgentHeader: 'dio',
      'x-access-token': 'zhang',
    };

  dio.interceptors
    ..add(InterceptorsWrapper(
      onRequest: (Options options) {
        // return ds.resolve( Response(data:"xxx"));
        // return ds.reject( DioError(message: "eh"));
        return options;
      },
    ))
    ..add(LogInterceptor(responseBody: false)); //Open log;

  Response response = await dio.get("/test");
  print(response.data);
}

final fetchTypes = <String, Function>{
    'post': dio.post,
    'put': dio.put,
    'patch': dio.patch,
    'delete': dio.delete,
    'head': dio.head,
  };