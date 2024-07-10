import 'package:first/Services/Http_Service.dart';
import 'package:first/models/Recipe.dart';

class DataService {
  static final DataService _singleton = DataService._internal();
  final HttpService _httpService = HttpService();

  factory DataService() {
    return _singleton;
  }
  DataService._internal();

  Future<List<Recipe>?> getRecipes() async {
    String path = "recipes/";
    var response = await _httpService.get(path);

    if (response?.statusCode == 200 && response?.data != null) {
      print(response!.data);
    }
  }
}