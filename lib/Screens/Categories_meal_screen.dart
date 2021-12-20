import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import 'package:mealapp/Widgets/MealItem.dart';
import 'package:mealapp/Models/Meal.dart';

class CategoriesMeals extends StatefulWidget {
  static const RouteName = "Category_Meals";
  final List<Meal> availableMeal;

  const CategoriesMeals( this.availableMeal);


  @override
  _CategoriesMealsState createState() => _CategoriesMealsState();
}

class _CategoriesMealsState extends State<CategoriesMeals> {
  String categoryTitle;
  List<Meal> categoryMeal;

  @override
  void didChangeDependencies() {
    // to recive data from  cateogyItem
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryId = routeArg['id'];
    categoryTitle = routeArg['title'];
    // now we need to fillter category  محتاجين منه يعرض الوجبات الى الايدى بتعاها موجود من ضمن التصنيف ده DUMMY_MEALS ب اختصار احناا جبنا الملف الي اسمه
    categoryMeal = widget.availableMeal
        // this to filtter who i need
        .where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    setState(() {
      categoryMeal.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMeal[index].id,
            imageUrl: categoryMeal[index].imageUrl,
            title: categoryMeal[index].title,
            duration: categoryMeal[index].duration,
            complexity: categoryMeal[index].complexity,
            affordability: categoryMeal[index].affordability,
          );
        },
        itemCount: categoryMeal.length,
      ),
    );
  }
}
