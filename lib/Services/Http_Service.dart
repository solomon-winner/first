import 'package:dio/dio.dart';

class HttpService {
  static final HttpService _singleton =HttpService._internal();
 
 final _dio = Dio();

  factory HttpService() {
    return _singleton;
  }

  HttpService._internal() {
setup(); 
  }

  Future<void> setup({String? bearerToken}) async {}
}