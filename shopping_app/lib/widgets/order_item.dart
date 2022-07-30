import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shopping_app/providers/orders_provider.dart';

class OrderItem extends StatelessWidget {
  const OrderItem({Key? key, required this.order}) : super(key: key);
  final Order order;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        children: [
          ListTile(
            title: Text('Total Amount \$${order.amount}'),
            subtitle: Text(DateFormat('dd MM yyyy').format(order.dateTime)),
            trailing: IconButton(
              icon: Icon(Icons.expand_more),
              onPressed: () {},
            ),
          )
        ],
      ),
    );
  }
}
