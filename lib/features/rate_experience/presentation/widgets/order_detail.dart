import 'package:flutter/material.dart';
import 'package:lieferking_ui_task/features/rate_experience/data/models/ordered_food_model.dart';

import 'widgets.dart';

class OrderDetails extends StatelessWidget {
  final String orderedFoodID;
  final String paymentMethod;
  final double totalPrice;
  final String foodType;
  final List<Food> foods;
  final String orderDateAndTime;

  const OrderDetails({
    Key? key,
    required this.orderedFoodID,
    required this.paymentMethod,
    required this.totalPrice,
    required this.foodType,
    required this.foods,
    required this.orderDateAndTime,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: const [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 6.0,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Text(
                foodType,
                style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Column(
                // Add this line
                children: <Widget>[
                  const Text(
                    'Paid Via',
                    style: TextStyle(color: Colors.grey),
                  ),
                  if (paymentMethod == 'visa')
                    Image.asset(
                      'assets/images/visa.png',
                      width: 50,
                      height: 30,
                    ),
                ],
              )
            ],
          ),
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Order # ' '$orderedFoodID',
                style: const TextStyle(
                    color: Colors.black,
                    fontSize: 18,
                    fontFamily: 'poppins',
                    fontWeight: FontWeight.bold),
              ),
              Text(
                '\$$totalPrice',
                style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
            ],
          ),
          Text(
            orderDateAndTime,
            style: const TextStyle(color: Colors.black, fontSize: 10),
          ),
          const SizedBox(height: 16),
          ...foods.asMap().entries.map((entry) {
            int idx = entry.key;
            Food food = entry.value;
            return Column(
              children: [
                OrderItem(
                  name: food.foodName,
                  details: food.additionalPreference,
                  quantity: food.totalFoods.toInt(),
                ),
                if (idx < foods.length - 1)
                  const Divider(
                    height: 24,
                    color: Colors.black,
                  ),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}
