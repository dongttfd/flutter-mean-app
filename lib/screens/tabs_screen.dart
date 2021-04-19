import 'package:flutter/material.dart';

import 'package:meal/widgets/main_drawer.dart';
import 'package:meal/screens/categories_screen.dart';
import 'package:meal/screens/favorites_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Object>> _pages = [
    {
      'title': 'Categories',
      'page': CategoriesScreen(),
      'bottomICon': Icon(Icons.category),
    },
    {
      'title': 'Favorites',
      'page': FavoritesScreen(),
      'bottomICon': Icon(Icons.star),
    },
  ];

  int _pageIndexSelected = 0;

  void _selectPage(int index) {
    setState(() {
      _pageIndexSelected = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_pageIndexSelected]['title']),
      ),
      drawer: MainDrawer(),
      body: _pages[_pageIndexSelected]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage,
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _pageIndexSelected,
        type: BottomNavigationBarType.shifting,
        items: _pages
            .map(
              (page) => BottomNavigationBarItem(
                backgroundColor: Theme.of(context).primaryColor,
                label: page['title'],
                icon: page['bottomICon'],
              ),
            )
            .toList(),
      ),
    );
  }
}
