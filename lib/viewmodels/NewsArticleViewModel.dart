import 'package:newsx/model/NewsArticle.dart';

class NewsArticleViewModel{

  NewsArticle _newsArticle;

  NewsArticleViewModel({NewsArticle newsArticle}):_newsArticle = newsArticle;

  String get title{
    return _newsArticle.title;
  }

  String get description{
    return _newsArticle.description;
  }

  String get imageUrl{
    return _newsArticle.urlToImage;
  }

  String get url{
    return _newsArticle.url;
  }
}