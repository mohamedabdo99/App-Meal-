import 'package:flutter/material.dart';
import 'package:mealapp/Models/Meal.dart';
import 'package:mealapp/Screens/Categories_meal_screen.dart';
import 'package:mealapp/Screens/Filters_screen.dart';
import 'package:mealapp/Screens/meal_details_screen.dart';
import 'package:mealapp/Screens/taps_screen.dart';
import 'package:mealapp/dummy_data.dart';
import 'Screens/Categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'vegan': false,
    'vegetarian': false,
    'lactose': false,
  };

  List<Meal> _avilableMeal = DUMMY_MEALS;
  List<Meal> _favoriteMeal = [];

  void _setFilter(Map<String, bool> _filtersData) {
    setState(() {
      _filters = _filtersData;

      _avilableMeal = DUMMY_MEALS.where((meal) {
        //this like _filters['gluten'] == true .....
        //!meal.isGlutenFree like meal.isGlutenFree== false
        if (_filters['gluten'] && !meal.isGlutenFree) {
          return false;
        }

        if (_filters['vegan'] && !meal.isVegan) {
          return false;
        }

        if (_filters['vegetarian'] && !meal.isVegetarian) {
          return false;
        }

        if (_filters['lactose'] && !meal.isLactoseFree) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavorite(String mealId) {
    final existingIndex = _favoriteMeal.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeal.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeal.add(DUMMY_MEALS.firstWhere((meal) => meal.id == mealId));
      });
    }
  }

  bool _isFavorite(String id) {
    _favoriteMeal.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          // color of app bar
          primarySwatch: Colors.pink,
          accentColor: Colors.amber,
          // canvasColor color of background body
          canvasColor: Color.fromRGBO(255, 254, 229, 1),
          textTheme: ThemeData.light().textTheme.copyWith(
                bodyText1: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                bodyText2: TextStyle(color: Color.fromRGBO(20, 50, 50, 1)),
                subtitle1: TextStyle(
                  fontSize: 15,
                  fontFamily: 'RobotoCondensed',
                ),
              )),
      // home: MyHomePage(),
      routes: {
        '/': (ctx) => TapsScreen(_toggleFavorite, _favoriteMeal),
        CategoriesMeals.RouteName: (context) => CategoriesMeals(_avilableMeal),
        MealDetail.RouteName: (context) => MealDetail(_toggleFavorite,_isFavorite),
        FiltersScreen.routName: (context) =>
            FiltersScreen(_filters, _setFilter),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Meal App"),
      ),
      body: CategoriesScreen(),
    );
  }
}
