import 'package:flutter/material.dart';
import 'package:newsprovider_app/src/news/data/remote/models/news_response.dart';
import 'package:newsprovider_app/src/news/presentation/theme/dark_theme.dart';

class News extends StatelessWidget {
  final List<Article> news;

  const News(this.news);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: news.length,
        itemBuilder: (context, index) {
          return _New(article: news[index], index: index);
        });
  }
}

class _New extends StatelessWidget {
  final Article article;
  final int index;

  _New({@required this.article, @required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _CardTopBar(article, index),
        _CardTitle(article),
        _CardImage(article),
        _CardBody(article),
        _CardButtons(),
        SizedBox(height: 10),
        Divider(),
      ],
    );
  }
}

class _CardTopBar extends StatelessWidget {
  final Article article;
  final int index;

  const _CardTopBar(this.article, this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ',
              style: TextStyle(color: darkTheme.accentColor)),
          Text('${article.source.name}. '),
        ],
      ),
    );
  }
}

class _CardTitle extends StatelessWidget {
  final Article article;

  const _CardTitle(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: Text(article.title,
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)));
  }
}

class _CardImage extends StatelessWidget {
  final Article article;

  const _CardImage(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0), bottomRight: Radius.circular(50.0)),
        child: Container(
          child: _buildImage(article),
        ),
      ),
    );
  }

  Widget _buildImage(Article article) {
    if (article.urlToImage != null) {
      return FadeInImage(
          placeholder: AssetImage('assets/images/giphy.gif'),
          image: NetworkImage(article.urlToImage));
    } else {
      return Image(image: AssetImage('assets/images/no-image.png'));
    }
  }
}

class _CardBody extends StatelessWidget {
  final Article article;

  const _CardBody(this.article);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Text((article.description != null) ? article.description : ''),
    );
  }
}

class _CardButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildRawMaterialButton(
              darkTheme.accentColor, Icons.star_border, () {}),
          SizedBox(width: 10.0),
          _buildRawMaterialButton(Colors.blue, Icons.more, () {}),
        ],
      ),
    );
  }

  Widget _buildRawMaterialButton(
      Color color, IconData iconData, Function function) {
    return RawMaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
        fillColor: color,
        child: Icon(iconData),
        onPressed: function);
  }
}
