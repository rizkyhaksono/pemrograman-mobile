import 'package:demo_mobile/routes/page_names.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:demo_mobile/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("MainApp displays UI elements", (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MainApp());

    // Verify that the MainApp widget is rendered.
    expect(find.byType(const GetMaterialApp() as Type), findsOneWidget);

    // Verify that the initial route is set to the splash page.
    expect(Get.currentRoute, equals(PageName.splash));

    // Verify that a widget with the text 'YourAppTitle' is present.
    expect(find.text('YourAppTitle'), findsOneWidget);

    // Add more expectations based on your UI structure.

    // You can also perform interactions and verify the results.
    // For example, you can simulate a tap and check if it navigates to the correct page.
    // await tester.tap(find.byType(MyButtonWidget));
    // await tester.pump();

    // Add more testing logic as needed.
  });
}
