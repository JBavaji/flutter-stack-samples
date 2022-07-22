import 'package:flutter/material.dart';
import 'package:shoping_app/models/product.dart';
import 'package:shoping_app/screens/product_details_screen.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key, required this.item}) : super(key: key);
  final Product item;

  @override
  Widget build(BuildContext context) {
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
              icon: Icon(Icons.favorite),
              onPressed: () {},
            ),
            trailing: IconButton(
              onPressed: () {},
              color: Theme.of(context).accentColor,
              icon: Icon(Icons.shopping_cart),
            ),
          ),
        ),
      ),
    );
  }
}
