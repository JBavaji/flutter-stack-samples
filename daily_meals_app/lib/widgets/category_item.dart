import 'package:daily_meals_app/model/category.dart';
import 'package:daily_meals_app/screens/category_meal_screen.dart';
import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  final Category category;

  const CategoryItem({
    Key? key,
    required this.category,
  }) : super(key: key);

  void selectCategory(BuildContext ctx) {
    // Navigator.of(ctx).push(
    //   MaterialPageRoute(builder: (_) {
    //     return CategoryMealScreen(category: category);
    //   }),
    // );

    Navigator.of(ctx).pushNamed(
      CategoryMealScreen.routeName,
      arguments: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    final title = category.title;
    final color = category.color;

    return InkWell(
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        selectCategory(context);
      },
      child: Container(
        padding: EdgeInsets.all(15),
        child: Center(
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline6,
          ),
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [color.withOpacity(0.7), color],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
