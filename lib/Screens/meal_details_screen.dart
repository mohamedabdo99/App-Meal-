import 'package:flutter/material.dart';
import 'package:mealapp/dummy_data.dart';

class MealDetail extends StatelessWidget {
  static const RouteName = "categoriy_details";

  final Function toggleFavorite;
  final Function isFavorite;

  const MealDetail(this.toggleFavorite, this.isFavorite);

  @override
  Widget build(BuildContext context) {
    final routeArg =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final idDetails = routeArg['id'];
    final titleDetails = routeArg['title'];
    // filltering
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == idDetails);

    Widget buildTitle(BuildContext context, String tit) {
      return Container(
        margin: EdgeInsets.only(
          top: 10,
        ),
        child: Text(
          tit,
          style: Theme.of(context).textTheme.headline6,
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          titleDetails,
          style: TextStyle(
            fontSize: 17,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(
                top: 10,
              ),
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            buildTitle(context, "ingredients"),
            Container(
              margin: EdgeInsets.only(top: 11),
              padding: EdgeInsets.all(10),
              // عشان اعمل حواف لل كارد فيو
              decoration: BoxDecoration(
                // الحواف
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                //لون الحواف
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Card(
                  color: Theme.of(context).accentColor,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      selectedMeal.ingredients[index],
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildTitle(context, "Steps"),
            Container(
              margin: EdgeInsets.all(11),
              padding: EdgeInsets.all(10),
              // عشان اعمل حواف لل كارد فيو
              decoration: BoxDecoration(
                // الحواف
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                //لون الحواف
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              height: 150,
              width: 300,
              child: ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text("${index + 1}"),
                      ),
                      title: Text(
                        selectedMeal.steps[index],
                      ),
                    ),
                    //عشان اخلي مسافه بين كل خطوه
                    Divider(),
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: 
      FloatingActionButton(
        onPressed: ()=>toggleFavorite(idDetails),
        child: Icon(
        isFavorite(idDetails) ? Icons.favorite : Icons.favorite_border,
        ),
      ),
    );
  }
}
