import 'package:flutter/material.dart';

class OrderItem extends StatelessWidget {
  final String name;
  final String details;
  final int quantity;

  const OrderItem(
      {required this.name, required this.details, required this.quantity});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Text(
              name,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            Text(
              '$quantity' ' quantity',
              style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
            ),
          ],
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          details,
          style: const TextStyle(color: Colors.grey, fontSize: 12),
        ),
      ],
    );
  }
}
