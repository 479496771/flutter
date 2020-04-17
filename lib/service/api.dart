import 'package:dio/dio.dart';
import 'dart:async';
import '../config/service.dart';

// const servicePath = {
//   "test": serviceUrl + 'test',
//   "testDetail": serviceUrl + 'detail',
// };
Response<String> response;

Future getTestData () async{
  try {
    response = await dio.get("/test");
    if(response.statusCode == 200){
      print('接口正常。。。。。。。。。。。。。。。。。。。。。。。。。');
      return response.data;
    } else {
      throw Exception('接口错误');
    }
  } catch (e) {
    return print('ERROR =======> $e');
  }
}
