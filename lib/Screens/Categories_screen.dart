import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';
import '../Widgets/Categories_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: GridView(
        padding: EdgeInsets.all(20),
        children: DUMMY_CATEGORIES.map((catData) => 
        CategoriesItem(catData.id,catData.title , catData.color),
        ).toList(),
        // GridView setting
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,
          childAspectRatio: 3/2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
      ),
    );
  }
}
