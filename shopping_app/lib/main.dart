import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/providers/orders_provider.dart';
import 'package:shopping_app/screens/cart_screen.dart';

import '/screens/product_overview_screen.dart';
import 'providers/products_provider.dart';
import 'screens/product_details_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => ProductProvider()),
        ChangeNotifierProvider(create: (ctx) => CartProvider()),
        ChangeNotifierProvider(create: (ctx) => OrderProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.teal,
            accentColor: Colors.pink,
            fontFamily: 'Lato'),
        initialRoute: ProductOverviewScreen.routeName,
        routes: {
          ProductOverviewScreen.routeName: (_) => ProductOverviewScreen(),
          ProductDetailsScreen.routeName: (_) => ProductDetailsScreen(),
          CartScreen.routeName: (_) => CartScreen(),
        },
      ),
    );
  }
}
