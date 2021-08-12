import 'package:flutter/material.dart';

import 'package:lets_learn/models/category_news_model.dart';

import 'package:lets_learn/helper/category_news.dart';

import 'home _screen.dart';

class CategoryNews extends StatefulWidget {
  final String category;
  CategoryNews({required this.category});
  @override
  _CategoryNewsState createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  @override
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
        actions: <Widget>[
          Opacity(
            opacity: 0,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Icon((Icons.save)),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 1.0 / 2,
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        child: Container(
          child: Column(
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 8.0, left: 16.0, right: 16.0),
                child: FutureBuilder<CategoryNewsModel?>(
                  future: CategoryNewsClass().getCategoryNews(widget.category),
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
    );
  }
}
