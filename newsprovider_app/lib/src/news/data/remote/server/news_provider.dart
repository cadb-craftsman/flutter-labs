import 'package:newsprovider_app/src/news/data/remote/models/news_response.dart';
import 'package:newsprovider_app/src/news/data/remote/server/api_news.dart';

class NewsProvider implements ApiNews {

  List<Article>headLines = [];


  @override
  getTopHeadLines() {
    // TODO: implement getHeadLines
    throw UnimplementedError();
  }
}
