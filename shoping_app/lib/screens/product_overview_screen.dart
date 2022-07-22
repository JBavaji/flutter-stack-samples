import 'package:flutter/material.dart';
import 'package:shoping_app/models/product.dart';
import 'package:shoping_app/widgets/product_item.dart';

import '../models/default_loaded_products.dart';

class ProductOverviewScreen extends StatelessWidget {
  ProductOverviewScreen({Key? key}) : super(key: key);

  final List<Product> loadedProducts = DEFAULT_LOADED_PRODUCTS;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Shop'),
      ),
      body: GridView.builder(
        itemCount: loadedProducts.length,
        padding: EdgeInsets.all(10),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (_, index) => ProductItem(item: loadedProducts[index]),
      ),
    );
  }
}
