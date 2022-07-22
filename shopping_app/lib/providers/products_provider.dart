import 'package:flutter/material.dart';

import '../models/default_loaded_products.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = DEFAULT_LOADED_PRODUCTS;

  List<Product> get items {
    return [..._items];
  }
}
