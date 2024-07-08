import 'package:dio/dio.dart';
import 'package:first/Consts.dart';

class HttpService {
  static final HttpService _singleton =HttpService._internal();
 
 final _dio = Dio();

  factory HttpService() {
    return _singleton;
  }

  HttpService._internal() {
setup(); 
  }

  Future<void> setup({String? bearerToken}) async {
    final headers = {
      "Content-Type": "application/json",
    };

    final options = BaseOptions(
      baseUrl: API_BASE_URL,
      headers: headers,
      validateStatus: (status) {
        if (status == null) return false;
        return status < 500;
      }
    );
    _dio.options = options;
  }

  Future<Response?> post(String path, Map data) async {
    try {
      final response = await _dio.post(
        path,
        data:data,
      );
    }
     catch (e) {
      print(e);  
    }
  }
}