import 'package:daily_meals_app/model/category.dart';
import 'package:daily_meals_app/model/meal.dart';
import 'package:daily_meals_app/widgets/category_meal_item.dart';
import 'package:flutter/material.dart';

class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals;

  const FavoritesScreen({Key? key, required this.favoriteMeals})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (favoriteMeals.isEmpty) {
      return Center(
        child: Text('You have no favorites yet, start adding some!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return CategoryMealItem(
              meal: favoriteMeals[index],
              category: Category(id: "", title: ""));
        },
        itemCount: favoriteMeals.length,
      );
    }
  }
}
