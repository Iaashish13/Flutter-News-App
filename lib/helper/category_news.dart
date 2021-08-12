import 'dart:convert';
import 'package:lets_learn/models/category_news_model.dart';
import 'package:http/http.dart' as http;

class CategoryNewsClass {
  Future<CategoryNewsModel?> getCategoryNews(String category) async {
    var client = http.Client();
    var categoryNewsModel;
    String url =
        "https://newsapi.org/v2/top-headlines?country=us&category=$category&apiKey=Your_API_KEY";
    try {
      var response = await client.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        categoryNewsModel = CategoryNewsModel.fromJson(jsonMap);
        return categoryNewsModel;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return categoryNewsModel;
  }
}
