import 'package:daily_meals_app/model/dummy_data.dart';
import 'package:daily_meals_app/model/meal.dart';
import 'package:daily_meals_app/screens/category_meal_screen.dart';
import 'package:daily_meals_app/screens/filter_screen.dart';
import 'package:daily_meals_app/screens/home_screen.dart';
import 'package:daily_meals_app/screens/meal_detail_screen.dart';
import 'package:daily_meals_app/screens/no_screen_found.dart';
import 'package:daily_meals_app/screens/to_do_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false
  };

  List<Meal> _availableMeals = DUMMY_MEALS;
  List<Meal> _favoriteMeals = [];

  _setFilters(Map<String, bool> filterData) {
    print(filterData);
    _availableMeals = DUMMY_MEALS
        .where((element) => _filterMeal(element, filterData))
        .toList();

    setState(() {
      _filters = filterData;
    });
  }

  bool _filterMeal(Meal meal, Map<String, bool> filterData) {
    if (filterData['gluten'] as bool && !meal.isGlutenFree) {
      return false;
    }

    if (filterData['lactose'] as bool && !meal.isLactoseFree) {
      return false;
    }

    if (filterData['vegan'] as bool && !meal.isVegan) {
      return false;
    }

    if (filterData['vegetarian'] as bool && !meal.isVegetarian) {
      return false;
    }

    return true;
  }

  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((element) => element.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        final meal = DUMMY_MEALS.firstWhere((element) => element.id == mealId);
        _favoriteMeals.add(meal);
      });
    }
  }

  bool _isMealFavorite(String mealId) {
    return _favoriteMeals.any((meal) => meal.id == mealId);
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Daily Meals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              bodyText1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              bodyText2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              headline6: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: "RobotoCondensed"),
            ),
      ),
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (_) => HomeScreen(favoriteMeals: _favoriteMeals),
        CategoryMealScreen.routeName: (_) =>
            CategoryMealScreen(_availableMeals),
        MealDetailScreen.routeName: (_) => MealDetailScreen(
              toggleFavorite: _toggleFavorite,
              isFavorite: _isMealFavorite,
            ),
        FiltersScreen.routeName: (_) => FiltersScreen(
              saveFilters: _setFilters,
              filerData: _filters,
            ),
      },
      onGenerateRoute: (settings) {
        print(settings);
        if (settings.name == ToDoScreen.routeName) {
          return MaterialPageRoute(builder: (_) => ToDoScreen());
        } else {
          return MaterialPageRoute(builder: (_) => NotFoundScreen());
        }
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(builder: (_) => NotFoundScreen());
      },
    );
  }
}
