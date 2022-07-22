import 'package:daily_meals_app/model/category.dart';
import 'package:daily_meals_app/model/meal.dart';
import 'package:daily_meals_app/model/meal_detail_screen_argument.dart';
import 'package:daily_meals_app/screens/meal_detail_screen.dart';
import 'package:flutter/material.dart';

class CategoryMealItem extends StatelessWidget {
  final Meal meal;
  final Category category;

  CategoryMealItem({Key? key, required this.meal, required this.category})
      : super(key: key);

  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
          MealDetailScreen.routeName,
          arguments: MealDetailScreenArgument(
            category: category,
            meal: meal,
            mealId: meal.id,
          ),
        )
        .then((value) => {if (value != null) {}});
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        selectMeal(context);
      },
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        margin: EdgeInsets.all(10),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  child: Image.network(
                    meal.imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
                Positioned(
                  bottom: 20,
                  right: 10,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    child: Text(
                      meal.title,
                      style: TextStyle(fontSize: 20, color: Colors.white),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  //  Duration
                  Row(
                    children: [
                      Icon(Icons.schedule),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${meal.duration} min")
                    ],
                  ),
                  // Complexity
                  Row(
                    children: [
                      Icon(Icons.work),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${meal.complexityText}")
                    ],
                  ),
                  //  Affordability
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(
                        width: 6,
                      ),
                      Text("${meal.affordabilityText}")
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
