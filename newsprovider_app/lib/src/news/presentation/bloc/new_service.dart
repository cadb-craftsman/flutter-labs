import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:newsprovider_app/src/news/domain/models/category.dart';
import 'package:newsprovider_app/src/news/data/remote/models/news_response.dart';

class NewService with ChangeNotifier {
  List<Article> headLines = [];
  List<Category> categories = [
    Category(FontAwesomeIcons.building, 'business'),
    Category(FontAwesomeIcons.tv, 'entertainment'),
    Category(FontAwesomeIcons.addressCard, 'general'),
    Category(FontAwesomeIcons.headSideVirus, 'health'),
    Category(FontAwesomeIcons.vials, 'science'),
    Category(FontAwesomeIcons.futbol, 'sports'),
    Category(FontAwesomeIcons.memory, 'technology')
  ];

  Map<String, List<Article>> categoryArticles = {};

  String _selectedCategory;

  final _URL_NEWS = 'https://newsapi.org/v2';
  final _API_KEYS = 'd1744d702a524962b66519a849d0cd4b';

  NewService() {
    this.getHeadLines();
    categories.forEach((element) {
      this.categoryArticles[element.name] = new List();
    });
  }

  String get selectedCategory => _selectedCategory;

  get articlesBySelectedCategory =>
      this.categoryArticles[this.selectedCategory];

  set selectedCategory(String value) {
    _selectedCategory = value;
    getArticleByCategory(value);
  }

  getHeadLines() async {
    final url = '$_URL_NEWS/top-headlines?country=mx&apiKey=$_API_KEYS';
    final response = await http.get(url);
    final newsResponses = newsResponseFromJson(response.body);

    this.headLines.addAll(newsResponses.articles);
    notifyListeners();

    print('Loading headlines...');
  }

  getArticleByCategory(String category) async {
    if (this.categoryArticles[category].length > 0) {
      notifyListeners();
      return categoryArticles[category];
    }

    final url =
        '$_URL_NEWS/top-headlines?country=mx&apiKey=$_API_KEYS&category=$category';
    final response = await http.get(url);
    final newsResponses = newsResponseFromJson(response.body);

    this.headLines.addAll(newsResponses.articles);
    this.categoryArticles[category].addAll(newsResponses.articles);
    notifyListeners();

    print('Loading Articles by $category');
  }
}
