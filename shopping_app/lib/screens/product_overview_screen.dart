import 'package:flutter/material.dart';

import '../models/default_loaded_products.dart';
import '../models/product.dart';
import '../widgets/product_grid.dart';

class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);
  static const routeName = '/';
  final List<Product> loadedProducts = DEFAULT_LOADED_PRODUCTS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: ProductGrid(),
    );
  }
}
