import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:newsprovider_app/src/news/domain/models/category.dart';
import 'package:newsprovider_app/src/news/presentation/bloc/new_service.dart';
import 'package:newsprovider_app/src/news/presentation/theme/dark_theme.dart';
import 'package:newsprovider_app/src/news/presentation/widgets/news.dart';

class TabTwoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final newService = Provider.of<NewService>(context);
    if (newService.articlesBySelectedCategory == null) {
      newService.selectedCategory = newService.categories[0].name;
    }
    return SafeArea(child: _buildScaffold(context, newService));
  }

  Widget _buildScaffold(BuildContext context, NewService newService) {
    return Scaffold(
      body: Column(children: [
        _buildListView(context, newService.categories),
        _buildExpanded(context, newService),
      ]),
    );
  }

  Widget _buildListView(BuildContext context, List<Category> categories) {
    return Container(
        width: double.infinity,
        height: 80,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) {
            return _buildContainer(categories, index);
          },
        ));
  }

  Widget _buildContainer(List<Category> categories, int index) {
    return Container(
      child: _buildPadding(categories, index),
    );
  }

  Widget _buildPadding(List<Category> categories, int index) {
    final catName = categories[index].name;

    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: [
          _CategotyButton(categories[index]),
          SizedBox(height: 5),
          Text('${catName[0].toUpperCase()}${catName.substring(1)}'),
        ],
      ),
    );
  }

  Widget _buildExpanded(BuildContext context, NewService newService) {
    return Expanded(child: News(newService.articlesBySelectedCategory));
  }
}

class _CategotyButton extends StatelessWidget {
  final Category category;

  const _CategotyButton(this.category);

  @override
  Widget build(BuildContext context) {
    return _buildGestureDetector(context, () {
      final newService = Provider.of<NewService>(context, listen: false);
      newService.selectedCategory = category.name;
    });
  }

  Widget _buildGestureDetector(BuildContext context, Function function) {
    final newService = Provider.of<NewService>(context);
    return GestureDetector(
      onTap: function,
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.white),
        child: Icon(
          category.icon,
          color: (newService.selectedCategory == this.category.name)
              ? darkTheme.accentColor
              : Colors.black54,
        ),
      ),
    );
  }
}
