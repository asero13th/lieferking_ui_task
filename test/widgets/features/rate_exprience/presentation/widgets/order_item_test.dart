import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lieferking_ui_task/features/rate_experience/presentation/widgets/widgets.dart';

void main() {
  testWidgets('OrderItem displays correctly', (WidgetTester tester) async {
    // Build the OrderItem widget
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: OrderItem(
            name: 'Pizza',
            details: 'Pizza without onion, but a lot of cheese',
            quantity: 1,
          ),
        ),
      ),
    );

    // Verify that the OrderItem widget displays the correct information
    expect(find.text('Pizza'), findsOneWidget);
    expect(find.text('1 quantity'), findsOneWidget);
    expect(find.text('Pizza without onion, but a lot of cheese'), findsOneWidget);
  });
}