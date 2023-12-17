import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:demo_mobile/main.dart' as app;
import 'package:demo_mobile/presentation/splash/splash_page.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("SplashPage displays UI elements", (WidgetTester tester) async {
    app.main();

    await tester.pumpAndSettle();

    expect(find.byType(SplashPage), findsOneWidget);

    expect(
      find.widgetWithText(Container, 'Picvie'),
      findsOneWidget,
    );

    expect(find.byType(Image), findsOneWidget);
    expect(find.text('Picvie'), findsOneWidget);
  });
}
