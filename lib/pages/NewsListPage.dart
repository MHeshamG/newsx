import 'package:flutter/material.dart';
import 'package:flutter/material.dart' as prefix0;
import 'package:flutter/services.dart';
import 'package:newsx/pages/NewsList.dart';
import 'package:newsx/viewmodels/NewsArticleListViewModel.dart';
import 'package:newsx/viewmodels/NewsArticleListViewModel.dart' as prefix1;
import 'package:newsx/viewmodels/NewsArticleViewModel.dart';
import 'package:provider/provider.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsListPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return NewsListPageState();
  }
}

class NewsListPageState extends State {
  final _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    Provider.of<NewsArticleListViewModel>(context, listen: false)
        .populateHeadlines();
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<NewsArticleListViewModel>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Top News"),
      ),
      body: Column(
        children: <Widget>[
          TextField(
            controller: _controller,
            onSubmitted: (keyword) {
              viewModel.search(keyword);
            },
            decoration: InputDecoration(
                labelText: "Enter search text",
                icon: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(Icons.search),
                ),
                suffixIcon: IconButton(
                  icon: Icon(Icons.clear),
                  onPressed: () {
                    _controller.clear();
                  },
                )),
          ),
          buildList(context, viewModel)
        ],
      ),
    );
  }

  Widget buildList(BuildContext context, NewsArticleListViewModel viewModel) {
    Widget widget;
    switch (viewModel.currentState) {
      case NewsLoadingState.loading:
        widget = CircularProgressIndicator();
        break;
      case NewsLoadingState.completed:
        widget = Expanded(
          child: NewsList(
            newsArticles: viewModel.newsArticleViewModelList,
            onSelected: (article) {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => NewArticleDetails(article)),
              );
            },
          ),
        );
        break;
    }
    return widget;
  }
}

class NewArticleDetails extends StatelessWidget {
  NewsArticleViewModel article;

  NewArticleDetails(this.article);

  @override
  Widget build(BuildContext context) {
    print(article.url);
    return WebView(
      initialUrl: this.article.url,
    );
  }
}
