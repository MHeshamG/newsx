import 'package:flutter/material.dart';
import 'package:newsx/viewmodels/NewsArticleViewModel.dart';

class NewsList extends StatelessWidget {

  final List<NewsArticleViewModel> newsArticles;
  final Function(NewsArticleViewModel article) onSelected;

  NewsList({this.newsArticles,this.onSelected});

  @override
  Widget build(BuildContext context) => buildListView();

  ListView buildListView() {
    print(newsArticles.length);
    return ListView.builder(
        itemCount: newsArticles.length,
        itemBuilder: (context, index) {
          final article = newsArticles[index];
          return ListTile(
            onTap: (){
              onSelected(article);
            },
            leading: Container(
                width: 100,
                height: 100,
                child: article.imageUrl == null ? Image.asset("images/news-placeholder.png") : Image.network(article.imageUrl)),
            title: Text(article.title),
          );
        });
  }

}
