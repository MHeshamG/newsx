import 'package:flutter/material.dart';
import 'package:newsx/model/NewsArticle.dart';
import 'package:newsx/services/WebService.dart';
import 'package:newsx/viewmodels/NewsArticleViewModel.dart';

class NewsArticleListViewModel extends ChangeNotifier{
  List<NewsArticleViewModel> newsArticleViewModelList = List<NewsArticleViewModel>();
  var currentState = NewsLoadingState.loading;

  void search(String keyword) async{
    currentState = NewsLoadingState.loading;
    List<NewsArticle> newsArticlesList = await WebService().fetchHeadLinesByKeyword(keyword);
    currentState = NewsLoadingState.completed;
    _createListAndNotify(newsArticlesList);
  }

  void populateHeadlines() async{
    currentState = NewsLoadingState.loading;
    List<NewsArticle> newsArticlesList = await WebService().fetchTopHeadLines();
    currentState = NewsLoadingState.completed;
    _createListAndNotify(newsArticlesList);
  }

  void _createListAndNotify(List<NewsArticle> newsArticlesList) {
    this.newsArticleViewModelList = newsArticlesList.map((article) => NewsArticleViewModel(newsArticle: article)).toList();
    notifyListeners();
  }
}

enum NewsLoadingState{
  loading,
  completed
}