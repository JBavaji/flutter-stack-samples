import 'package:daily_meals_app/model/category.dart';
import 'package:daily_meals_app/model/meal.dart';
import 'package:daily_meals_app/widgets/category_meal_item.dart';
import 'package:flutter/material.dart';

class CategoryMealScreen extends StatefulWidget {
  static const routeName = "/category-meals";
  final List<Meal> availableMeals;

  CategoryMealScreen(this.availableMeals);

  @override
  _CategoryMealScreenState createState() => _CategoryMealScreenState();
}

class _CategoryMealScreenState extends State<CategoryMealScreen> {
  late Category category;

  List<Meal> filterOutCategoryMeals(String id) => widget.availableMeals
      .where((meal) => meal.categories.contains(id))
      .toList(growable: true);

  List<Meal> meals = List.empty();

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    category = ModalRoute.of(context)!.settings.arguments as Category;
    meals = filterOutCategoryMeals(category.id);
    super.didChangeDependencies();
  }

  void removeMealItem(String mealId) {
    setState(() {
      meals.removeWhere((element) => element.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category.title),
        backgroundColor: category.color,
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return CategoryMealItem(
            meal: meals[index],
            category: category,
          );
        },
        itemCount: meals.length,
      ),
    );
  }
}
