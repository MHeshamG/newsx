import 'dart:convert';

import 'package:newsx/model/NewsArticle.dart';
import 'package:http/http.dart' as http;
import 'package:newsx/services/Constants.dart';

class WebService {

  Future<List<NewsArticle>> fetchHeadLinesByKeyword(String keyword) async {
    return await fetchNewsData(Constants.getHEADLINES_BY_KEYWORD_URL(keyword));
  }

  Future<List<NewsArticle>> fetchTopHeadLines() async {
    return await fetchNewsData(Constants.TOP_HEADLINES_URL);
  }

  Future<List<NewsArticle>> fetchNewsData(String url) async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result["articles"];
      return list.map((article) => NewsArticle.fromJson(article)).toList();
    }
    else {
      throw Exception("Faild to get top news");
    }
  }

}