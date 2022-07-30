import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shopping_app/providers/orders_provider.dart';
import 'package:shopping_app/widgets/order_item.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ordersProvider = Provider.of<OrderProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Your Orders'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => OrderItem(
          order: ordersProvider.orders[index],
        ),
        itemCount: ordersProvider.orders.length,
      ),
    );
  }
}
