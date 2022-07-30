import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';

import '../models/product.dart';
import '../screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<Product>(context, listen: false);
    final cart = Provider.of<CartProvider>(context, listen: false);

    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: GridTile(
        child: GestureDetector(
          onTap: () {
            Navigator.of(context).pushNamed(
              ProductDetailsScreen.routeName,
              arguments: item.id,
            );
          },
          child: Image.network(
            item.imageUrl,
            fit: BoxFit.cover,
          ),
        ),
        footer: ClipRRect(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(5),
            bottomRight: Radius.circular(5),
          ),
          child: GridTileBar(
            backgroundColor: Colors.black87,
            title: Text(
              item.title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            ),
            leading: IconButton(
              color: Theme.of(context).accentColor,
              icon: Icon(
                item.isFavorite ? Icons.favorite : Icons.favorite_border,
              ),
              onPressed: () {
                item.toggleFavoriteStatus();
              },
            ),
            trailing: IconButton(
              onPressed: () {
                cart.addItem(item.id, item.price, item.title);
              },
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.shopping_cart_outlined),
            ),
          ),
        ),
      ),
    );
  }
}
