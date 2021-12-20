import 'package:flutter/material.dart';
import 'package:mealapp/Models/Meal.dart';
import 'package:mealapp/Screens/Categories_screen.dart';
import 'package:mealapp/Screens/Favorite_screen.dart';
import 'package:mealapp/Screens/drawer_screen.dart';

class TapsScreen extends StatefulWidget {
  final List<Meal> _favoriteMeal;
  final Function toggleFavorite;

  const TapsScreen(this.toggleFavorite,this._favoriteMeal);

  @override
  _TapsScreenState createState() => _TapsScreenState();
}

class _TapsScreenState extends State<TapsScreen> {
  List<Map<String, Object>> _pages;
  int _selectedIndexPage = 0;

  void _selectedPage(int value) {
    setState(() {
      _selectedIndexPage = value;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'page': CategoriesScreen(),
        'title': 'category',
      },
      {
        'page': favoriteScreen(widget._favoriteMeal),
        'title': 'favorite',
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedIndexPage]['title']),
      ),
      body: _pages[_selectedIndexPage]['page'],
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectedPage,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedIndexPage,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            title: Text("category"),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            title: Text("favorite"),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
