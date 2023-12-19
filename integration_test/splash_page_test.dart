import 'package:demo_mobile/presentation/splash/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('SplashPage UI Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MaterialApp(
      home: SplashPage(),
    ));

    expect(find.byType(SplashPage), findsOneWidget);

    expect(
      find.widgetWithText(Container, 'Picvie'),
      findsOneWidget,
    );

    expect(find.byType(Image), findsOneWidget);

    expect(find.text("Picvie"), findsOneWidget);
  });
}
