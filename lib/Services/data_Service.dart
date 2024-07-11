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
      try {
        List data = response!.data["recipes"];
        if (data == null || data.isEmpty) {
          print("Response data is null or empty");
          return null;
        }

        print("Response data: $data");

        List<Recipe> recipes = data.map((e) {
          print("Parsing recipe: $e");
          return Recipe.fromJson(e);
        }).toList();

        print("Parsed recipes 2: $recipes");
        return recipes;
      } catch (e) {
        print("Error parsing recipes: $e");
        return null;
      }
    } else {
      print("Error in response: ${response?.statusCode} - ${response?.data}");
      return null;
    }
  }
}
