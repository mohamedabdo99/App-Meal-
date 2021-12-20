import 'package:flutter/material.dart';
import 'package:mealapp/Screens/Categories_meal_screen.dart';

class CategoriesItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoriesItem(this.id, this.title, this.color);

  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(CategoriesMeals.RouteName,
    // send data to CategoryMeals screen
    arguments: {
      'id' : id,
      'title': title,
    },
    );

  }

  @override
  Widget build(BuildContext context) {
    // InkWell used for when click on item
    return InkWell(
      borderRadius: BorderRadius.circular(14),
      onTap: () => selectCategory(context),
      child: Container(
        padding: EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(14),
        ),
      ),
    );
  }
}
