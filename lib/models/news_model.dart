// To parse this JSON data, do
//
//     final newModel = newModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

NewModel? newModelFromJson(String str) => NewModel.fromJson(json.decode(str));

String newModelToJson(NewModel data) => json.encode(data.toJson());

class NewModel {
  NewModel({
    @required this.status,
    @required this.totalResults,
    @required this.articles,
  });

  final String? status;
  final int? totalResults;
  final List<Article>? articles;

  factory NewModel.fromJson(Map<String, dynamic> json) => NewModel(
        status: json["status"],
        totalResults: json["totalResults"],
        articles: List<Article>.from(
            json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status,
        "totalResults": totalResults,
        "articles": List<dynamic>.from(articles!.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    @required this.source,
    @required this.author,
    required this.title,
    required this.description,
    required this.url,
    required this.urlToImage,
    @required this.publishedAt,
    @required this.content,
  });

  final Source? source;
  final String? author;
  final String title;
  final String description;
  final String url;
  final String urlToImage;
  final DateTime? publishedAt;
  final String? content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"],
        urlToImage: json["urlToImage"] == null ? null : json["urlToImage"],
        publishedAt: DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source!.toJson(),
        "author": author == null ? null : author,
        "title": title,
        "description": description,
        "url": url,
        "urlToImage": urlToImage,
        "publishedAt": publishedAt!.toIso8601String(),
        "content": content == null ? null : content,
      };
}

class Source {
  Source({
    @required this.id,
    @required this.name,
  });

  final String? id;
  final String? name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name,
      };
}

// // To parse this JSON data, do
// //
// //     final newsModel = newsModelFromJson(jsonString);
//
// import 'dart:convert';
//
// NewsModel newsModelFromJson(String str) => NewsModel.fromJson(json.decode(str));
//
// String newsModelToJson(NewsModel data) => json.encode(data.toJson());
//
// class NewsModel {
//   NewsModel({
//     required this.status,
//     required this.totalResults,
//     required this.articles,
//   });
//
//   final String status;
//   final int totalResults;
//   final List<Article> articles;
//
//   factory NewsModel.fromJson(Map<String, dynamic> json) => NewsModel(
//         status: json["status"],
//         totalResults: json["totalResults"],
//         articles: List<Article>.from(
//             json["articles"].map((x) => Article.fromJson(x))),
//       );
//
//   Map<String, dynamic> toJson() => {
//         "status": status,
//         "totalResults": totalResults,
//         "articles": List<dynamic>.from(articles.map((x) => x.toJson())),
//       };
// }
//
// class Article {
//   Article({
//     required this.source,
//     required this.author,
//     required this.title,
//     required this.description,
//     required this.url,
//     required this.urlToImage,
//     required this.publishedAt,
//     required this.content,
//   });
//
//   final Source? source;
//   final String? author;
//   final String title;
//   final String description;
//   final String url;
//   final String urlToImage;
//   final DateTime? publishedAt;
//   final String? content;
//
//   factory Article.fromJson(Map<String, dynamic> json) => Article(
//         source: Source.fromJson(json["source"]),
//         author: json["author"] == null ? null : json["author"],
//         title: json["title"],
//         description: json["description"],
//         url: json["url"],
//         urlToImage: json["urlToImage"],
//         publishedAt: DateTime.parse(json["publishedAt"]),
//         content: json["content"],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "source": source!.toJson(),
//         "author": author == null ? null : author,
//         "title": title,
//         "description": description,
//         "url": url,
//         "urlToImage": urlToImage,
//         "publishedAt": publishedAt!.toIso8601String(),
//         "content": content,
//       };
// }
//
// class Source {
//   Source({
//     required this.id,
//     required this.name,
//   });
//
//   final Id? id;
//   final Name? name;
//
//   factory Source.fromJson(Map<String, dynamic> json) => Source(
//         id: idValues.map[json["id"]],
//         name: nameValues.map[json["name"]],
//       );
//
//   Map<String, dynamic> toJson() => {
//         "id": idValues.reverse![id],
//         "name": nameValues.reverse![name],
//       };
// }
//
// enum Id { THE_WALL_STREET_JOURNAL }
//
// final idValues =
//     EnumValues({"the-wall-street-journal": Id.THE_WALL_STREET_JOURNAL});
//
// enum Name { THE_WALL_STREET_JOURNAL }
//
// final nameValues =
//     EnumValues({"The Wall Street Journal": Name.THE_WALL_STREET_JOURNAL});
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String>? reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String>? get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
