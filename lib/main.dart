import 'package:flutter/material.dart';
import 'package:newsx/pages/NewsListPage.dart';
import 'package:newsx/viewmodels/NewsArticleListViewModel.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Fresh News",
      home: ChangeNotifierProvider(
        create: (_) => NewsArticleListViewModel(),
        child: NewsListPage(),
      ),
    );
  }
}
