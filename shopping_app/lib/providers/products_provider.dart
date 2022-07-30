import 'package:flutter/material.dart';

import '../models/default_loaded_products.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  List<Product> _items = DEFAULT_LOADED_PRODUCTS;

  List<Product> get items {
    return [..._items];
  }

  Product findById(String id) {
    return _items.firstWhere((item) => item.id == id);
  }

  List<Product> get favoriteItems {
    return _items.where((prodItem) => prodItem.isFavorite).toList();
  }

// void showFavoritesOnly() {
//   _showFavoritesOnly = true;
//   notifyListeners();
// }

// void showAll() {
//   _showFavoritesOnly = false;
//   notifyListeners();
// }

}
