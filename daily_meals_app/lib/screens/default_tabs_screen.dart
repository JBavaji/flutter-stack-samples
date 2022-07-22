import 'package:daily_meals_app/screens/categories_screen.dart';
import 'package:daily_meals_app/screens/favorites_screen.dart';
import 'package:flutter/material.dart';

class DefaultTabsScreen extends StatelessWidget {
  const DefaultTabsScreen({Key? key}) : super(key: key);
  static const routeName = "/";

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      initialIndex: 0,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Daily Meals'),
          bottom: TabBar(
            tabs: [
              Tab(
                icon: Icon(Icons.category),
                text: "Categories",
              ),
              Tab(
                icon: Icon(Icons.star),
                text: "Favorites",
              )
            ],
          ),
        ),
        body: TabBarView(
          children: [
            CategoriesScreen(),
            FavoritesScreen(
              favoriteMeals: [],
            ),
          ],
        ),
      ),
    );
  }
}
