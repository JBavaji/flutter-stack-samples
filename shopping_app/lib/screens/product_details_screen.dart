import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatelessWidget {
  static const routeName = '/product-details';

  ProductDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productId = ModalRoute.of(context)!.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(
        title: Text(productId),
      ),
    );
  }
}