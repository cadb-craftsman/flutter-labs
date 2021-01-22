import 'package:flutter/material.dart';
import 'package:newsprovider_app/src/news/presentation/pages/tabone_page.dart';
import 'package:newsprovider_app/src/news/presentation/pages/tabtwo_page.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _NavigationModel(),
      child: _buildScaffold(),
    );
  }

  Widget _buildScaffold() {
    return Scaffold(
      //appBar: AppBar(title: Text('TabsPage')),
      body: _TabPages(),
      bottomNavigationBar: _Navigation(),
    );
  }
}

class _Navigation extends StatelessWidget {
  const _Navigation();

  @override
  Widget build(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return BottomNavigationBar(
      currentIndex: navigationModel.currentPage,
      onTap: (i) => navigationModel.currentPage = i,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_outline), label: 'For you'),
        BottomNavigationBarItem(icon: Icon(Icons.public), label: 'Titled'),
      ],
    );
  }
}

class _TabPages extends StatelessWidget {
  const _TabPages();

  @override
  Widget build(BuildContext context) {
    return _buildPageView(context);
    /*
    return PageView(
      controller: navigationModel._pageController,
      //physics: BouncingScrollPhysics(),
      physics: NeverScrollableScrollPhysics(),
      children: [
        Container(
          color: Colors.red,
        ),
        Container(
          color: Colors.greenAccent,
        )
      ],
    );
     */
  }

  Widget _buildPageView(BuildContext context) {
    final navigationModel = Provider.of<_NavigationModel>(context);
    return PageView(
        controller: navigationModel._pageController,
        //physics: BouncingScrollPhysics(),
        physics: NeverScrollableScrollPhysics(),
        children: [
          TabOnePage(),
          TabTwoPage(),
        ]);
  }
}

class _NavigationModel with ChangeNotifier {
  int _currentPage = 0;
  PageController _pageController = new PageController();

  int get currentPage => _currentPage;

  set currentPage(int value) {
    _currentPage = value;
    _pageController.animateToPage(value,
        duration: Duration(milliseconds: 250), curve: Curves.easeInOut);
    notifyListeners();
  }

  PageController get pageController => _pageController;
}
