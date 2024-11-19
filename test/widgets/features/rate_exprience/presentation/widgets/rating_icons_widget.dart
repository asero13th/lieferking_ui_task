import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lieferking_ui_task/features/rate_experience/presentation/widgets/widgets.dart';

void main() {
  testWidgets('RatingSection displays correctly and allows rating selection',
      (WidgetTester tester) async {
    // Create mock callback functions
    void onDeliverySpeedChanged(int value) {}
    void onFoodQualityChanged(int value) {}
    void onFriendlinessChanged(int value) {}

    // Build the RatingSection widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: RatingSection(
            deliverySpeed: 3,
            foodQuality: 4,
            friendliness: 5,
            onDeliverySpeedChanged: onDeliverySpeedChanged,
            onFoodQualityChanged: onFoodQualityChanged,
            onFriendlinessChanged: onFriendlinessChanged,
          ),
        ),
      ),
    );

    // Verify that the RatingSection widget displays the correct labels
    expect(find.text('Delivery Speed ⚡️'), findsOneWidget);
    expect(find.text('Quality 🍕'), findsOneWidget);
    expect(find.text('Friendliness 🤩'), findsOneWidget);

    // Verify that the RatingRow widgets display the correct number of stars
    expect(find.byIcon(Icons.star), findsNWidgets(15));

    // Tap the third star in the first RatingRow and verify the selection
    await tester.tap(find.byIcon(Icons.star).at(2));
    await tester.pump();
    expect(find.byIcon(Icons.star).at(2), findsOneWidget);
  });
}
