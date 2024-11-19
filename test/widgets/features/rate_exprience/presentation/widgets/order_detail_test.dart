import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lieferking_ui_task/features/rate_experience/data/models/ordered_food_model.dart';
import 'package:lieferking_ui_task/features/rate_experience/presentation/widgets/widgets.dart';

void main() {
  testWidgets('OrderDetails displays correctly', (WidgetTester tester) async {
    // Create a sample list of foods
    final List<Food> foods = [
      Food(
        totalFoods: 1,
        foodName: 'Pizza',
        additionalPreference: 'Pizza without onion, but a lot of cheese',
      ),
      Food(
        totalFoods: 2,
        foodName: 'Burger',
        additionalPreference: 'Salad without banana, but a lot of grapes',
      ),
    ];

    // Build the OrderDetails widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: OrderDetails(
            orderedFoodID: '48493',
            paymentMethod: 'visa',
            totalPrice: 45.99,
            foodType: 'Cingo Foods',
            foods: foods,
            orderDateAndTime: '20/10/2024 | 05:00 PM',
          ),
        ),
      ),
    );

    // Verify that the OrderDetails widget displays the correct information
    expect(find.text('Cingo Foods'), findsOneWidget);
    expect(find.text('Paid Via'), findsOneWidget);
    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Order # 48493'), findsOneWidget);
    expect(find.text('\$45.99'), findsOneWidget);
    expect(find.text('20/10/2024 | 05:00 PM'), findsOneWidget);
    expect(find.text('Pizza'), findsOneWidget);
    expect(
        find.text('Pizza without onion, but a lot of cheese'), findsOneWidget);
    expect(find.text('Burger'), findsOneWidget);
    expect(
        find.text('Salad without banana, but a lot of grapes'), findsOneWidget);
  });
}
