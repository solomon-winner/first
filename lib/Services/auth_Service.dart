import 'package:first/Services/Http_Service.dart';
import '../models/User.dart';

class AuthService {
  static final AuthService _singleton =AuthService._internal();
  
  final _httpService = HttpService();
   
   User? user;

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

      if (response?.statusCode == 200 && response?.data !=null) {
        user = User.fromJson(response!.data);
      }

    } catch (e) {
      print(e);
    }
    return false;
  }

}