import 'package:daily_meals_app/model/category.dart';
import 'package:daily_meals_app/model/dummy_data.dart';
import 'package:daily_meals_app/model/meal.dart';
import 'package:daily_meals_app/model/meal_detail_screen_argument.dart';
import 'package:flutter/material.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = "/meal-details";
  void Function(String mealId) toggleFavorite;

  bool Function(String mealId) isFavorite;

  MealDetailScreen({
    Key? key,
    required this.toggleFavorite,
    required this.isFavorite,
  }) : super(key: key);

  Meal findSelectedMeal(String mealId) {
    return DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);
  }

  @override
  Widget build(BuildContext context) {
    final screenArguments =
        ModalRoute.of(context)!.settings.arguments as MealDetailScreenArgument;
    final Meal meal = findSelectedMeal(screenArguments.mealId);
    final Category category = screenArguments.category;

    return Scaffold(
      appBar: AppBar(
        title: Text(meal.title),
        backgroundColor: category.color,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //  meal image
            Container(
              height: 250,
              width: double.infinity,
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            // meal ingredients
            buildSectionTitle(context, 'Ingredients'),
            buildChildContainer(
                childWidget: ListView.builder(
              itemBuilder: (_, index) => Card(
                color: Colors.amberAccent,
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 5,
                    horizontal: 10,
                  ),
                  child: Text(
                    meal.ingredients[index],
                    style: Theme.of(context).textTheme.bodyText1,
                  ),
                ),
              ),
              itemCount: meal.ingredients.length,
            )),
            //  Steps
            buildSectionTitle(context, 'Steps'),
            buildChildContainer(
                childWidget: ListView.builder(
              itemBuilder: (_, index) => Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      child: Text('${index + 1}'),
                    ),
                    title: Text(
                      meal.steps[index],
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ),
                  Divider(),
                ],
              ),
              itemCount: meal.steps.length,
            )),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => toggleFavorite(meal.id),
        child: Icon(
          isFavorite(meal.id) ? Icons.star : Icons.star_border,
        ),
      ),
    );
  }

  Widget buildSectionTitle(BuildContext context, String title) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: Text(
        title,
        style: Theme.of(context).textTheme.headline6,
      ),
    );
  }

  Widget buildChildContainer({required Widget childWidget}) {
    return Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.black26),
            borderRadius: BorderRadius.circular(10)),
        margin: EdgeInsets.all(10),
        padding: EdgeInsets.all(5),
        height: 150,
        width: 300,
        child: childWidget);
  }
}
