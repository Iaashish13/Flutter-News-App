import 'dart:convert';
import 'package:lets_learn/constants.dart';
import 'package:http/http.dart' as http;
import 'package:lets_learn/models/news_model.dart';

class News {
  Future<NewsModel?> getNews() async {
    var client = http.Client();
    var newsModel;
    try {
      var response = await client.get(Uri.parse(Strings.newsUrl));
      if (response.statusCode == 200) {
        print(response.statusCode);
        var jsonString = response.body;
        var jsonMap = jsonDecode(jsonString);
        newsModel = NewsModel.fromJson(jsonMap);

        return newsModel;
      } else {
        print(response.statusCode);
      }
    } catch (e) {
      print(e);
    }
    return newsModel;
  }
}
