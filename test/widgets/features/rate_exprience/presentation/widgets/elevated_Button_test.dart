import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:lieferking_ui_task/features/rate_experience/presentation/widgets/widgets.dart';

// Create a Mock class for the onPressed callback
class MockCallback extends Mock {
  void call();
}

void main() {
  testWidgets('SubmitButton displays correctly and triggers onPressed',
      (WidgetTester tester) async {
    // Create a mock instance of the callback
    final mockCallback = MockCallback();

    // Build the SubmitButton widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SubmitButton(
            onPressed: mockCallback,
          ),
        ),
      ),
    );

    // Verify that the button is displayed with the correct text
    expect(find.text('Submit'), findsOneWidget);

    // Tap the button and verify that the onPressed callback is triggered
    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    // Verify that the mock callback was called
    verify(mockCallback()).called(1);
  });
}
