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
      List data = response!.data["recipes"];
      print("Response data: $data");
           try {
        List<Recipe> recipes = data.map((e) {
          print("Parsing recipe: $e");
          return Recipe.fromJson(e);
        }).toList();
        print("Parsed recipes: $recipes");
        return recipes;
      } catch (e) {
        print("Error parsing recipes: $e");
        return null;
      }
     // return recipes;
    }
  }
}