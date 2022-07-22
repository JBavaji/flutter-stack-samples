import 'package:flutter/material.dart';
import 'package:shoping_app/screens/product_details_screen.dart';
import 'package:shoping_app/screens/product_overview_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.teal,
          accentColor: Colors.pink,
          fontFamily: 'Lato'),
      home: ProductOverviewScreen(),
      routes: {
        ProductDetailsScreen.routeName: (_) => ProductDetailsScreen(),
      },
    );
  }
}
