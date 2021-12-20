import 'package:flutter/material.dart';
import 'package:mealapp/Models/Meal.dart';
import 'package:mealapp/Widgets/MealItem.dart';

// ignore: camel_case_types
class favoriteScreen extends StatelessWidget {
  final List<Meal> _favoriteMeal;

  const favoriteScreen(this._favoriteMeal);
  @override
  Widget build(BuildContext context) {
    if (_favoriteMeal.isEmpty) {
      return Center(
        child: Text("favoriteScreen"),
      );
    } else {
      return Scaffold(
        body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: _favoriteMeal[index].id,
            imageUrl: _favoriteMeal[index].imageUrl,
            title: _favoriteMeal[index].title,
            duration: _favoriteMeal[index].duration,
            complexity: _favoriteMeal[index].complexity,
            affordability: _favoriteMeal[index].affordability,
          );
        },
        itemCount: _favoriteMeal.length,
      ),
      );
    }
  }
}
