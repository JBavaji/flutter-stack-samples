import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/cart_provider.dart';
import 'package:shopping_app/providers/orders_provider.dart';
import 'package:shopping_app/widgets/cart_item.dart';

class CartScreen extends StatelessWidget {
  static const routeName = '/cart';

  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final cartProvide = Provider.of<CartProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Cart'),
      ),
      body: Column(
        children: [
          Card(
            margin: EdgeInsets.all(15),
            child: Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: TextStyle(fontSize: 20),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Spacer(),
                  Chip(
                    label: Text(
                      '\$${cartProvide.totalAmount}',
                      style: TextStyle(
                        color: Theme.of(context).primaryTextTheme.title?.color,
                      ),
                    ),
                    backgroundColor: Theme.of(context).primaryColor,
                  ),
                  TextButton(
                    onPressed: () {
                      Provider.of<OrderProvider>(context, listen: false)
                          .addOrder(
                              cartProvide.items.values.toList(growable: false),
                              cartProvide.totalAmount);

                      cartProvide.clear();
                    },
                    child: Text('Order Now'),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: ListView.builder(
              itemCount: cartProvide.items.length,
              itemBuilder: (context, index) => CartItem(
                cart: cartProvide.items.values.toList(growable: false)[index],
                productId:
                    cartProvide.items.keys.toList(growable: false)[index],
              ),
            ),
          )
        ],
      ),
    );
  }
}
