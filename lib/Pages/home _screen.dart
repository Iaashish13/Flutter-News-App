import 'package:flutter/material.dart';
import 'package:lets_learn/Pages/article_view.dart';
import 'package:lets_learn/Widgets/category_tile.dart';
import 'package:lets_learn/helper/category_data.dart';
import 'package:lets_learn/helper/news.dart';
import 'package:lets_learn/models/category_model.dart';
import 'package:lets_learn/models/news_model.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);

  // Future<NewsModel>? _newsModel;

  @override
  void initState() {
    categories = getCategories();
    // getNews();
    super.initState();
  }

  // getNews() async {
  //   _newsModel = (await News().getNews()) as Future<NewsModel>?;
  // }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'News',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                'App',
                style: TextStyle(
                  color: Colors.blueAccent,
                  fontWeight: FontWeight.w600,
                  fontSize: 18.0,
                ),
              ),
            ],
          ),
          centerTitle: true,
          elevation: 1.0 / 2,
        ),
        body: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: <Widget>[
                Container(
                  height: 100.0,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemCount: categories.length,
                      itemBuilder: (context, index) {
                        return CategoryTile(
                          imageUrl: categories[index].imageUrl,
                          categoryName: categories[index].categoryName,
                        );
                      }),
                ),
                Container(
                  padding: EdgeInsets.only(top: 8.0),
                  child: FutureBuilder<NewModel?>(
                    future: News().getNews(),
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data!.articles!.length,
                            itemBuilder: (context, index) {
                              var article = snapshot.data!.articles![index];
                              return BlogTile(
                                title: article.title,
                                description: article.description,
                                imageUrl: article.urlToImage,
                                url: article.url,
                              );
                            });
                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class BlogTile extends StatelessWidget {
  final String title, description, imageUrl, url;
  BlogTile(
      {required this.title,
      required this.description,
      required this.imageUrl,
      required this.url});
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.0),
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ArticleView(blogUrl: url)));
            },
            child: ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.network(imageUrl)),
          ),
          SizedBox(height: 6.0),
          Text(
            title,
            style: TextStyle(
              fontSize: 17.0,
              fontWeight: FontWeight.w700,
            ),
          ),
          SizedBox(height: 6.0),
          Text(
            description,
            style: TextStyle(
              fontSize: 12.0,
              color: Colors.black54,
            ),
          ),
        ],
      ),
    );
  }
}
