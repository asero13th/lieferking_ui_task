import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:lieferking_ui_task/features/rate_experience/presentation/widgets/widgets.dart';

void main() {
  testWidgets('CommentBox displays correctly and allows text input', (WidgetTester tester) async {
    // Build the CommentBox widget
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: CommentBox(),
        ),
      ),
    );

    // Verify that the CommentBox widget displays the correct label
    expect(find.text('Your comments (optional)'), findsOneWidget);

    // Enter text into the TextField and verify the input
    await tester.enterText(find.byType(TextField), 'This is a test comment');
    expect(find.text('This is a test comment'), findsOneWidget);
  });
}