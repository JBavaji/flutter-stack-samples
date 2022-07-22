import 'package:daily_meals_app/model/category.dart';
import 'package:daily_meals_app/model/meal.dart';

class MealDetailScreenArgument {
  final Category category;
  final Meal meal;
  final String mealId;

  MealDetailScreenArgument({
    required this.mealId,
    required this.category,
    required this.meal,
  });
}
