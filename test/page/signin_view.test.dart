import 'package:demo_mobile/presentation/auth/login/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';


void main() {
  testWidgets('LoginPage UI Test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(MaterialApp(
      home: LoginPage(),
    ));

    // Verify that the 'Sign In' text is present.
    expect(find.text('Sign In'), findsOneWidget);

    // Verify that the 'Email' and 'Password' text fields are present.
    expect(find.byType(TextField), findsNWidgets(2));

    // Tap on the 'Sign In' button.
    await tester.tap(find.text('Sign In'));
    await tester.pump();

    // Add more test cases based on your UI structure and interactions.
    // For example, you can test the visibility of the loading indicator when
    // 'Sign In' button is pressed, or you can test navigation to the 'Signup' page.

    // Example: Expect the loading indicator to be visible after tapping 'Sign In'.
    expect(find.byType(CircularProgressIndicator), findsOneWidget);
  });
}
