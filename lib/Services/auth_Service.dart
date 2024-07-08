import 'package:first/Services/Http_Service.dart';

class AuthService {
  static final AuthService _singleton =AuthService._internal();
  
  final _httpService = HttpService();
   
  factory AuthService() {
    return _singleton;
  }
  AuthService._internal();

  Future<bool> login(String UserName, String PassWord) async {
    try {
      var  response = await _httpService.post("auth/login", {
        "username": UserName,
        "password": PassWord,
      });
      print(response?.statusCode);
    } catch (e) {
      print(e);
    }
    return false;
  }

}