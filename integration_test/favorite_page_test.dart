import 'package:demo_mobile/presentation/dashboard/favorites/favorite_binding.dart';
import 'package:demo_mobile/presentation/dashboard/favorites/favorite_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:demo_mobile/presentation/dashboard/favorites/favorite_page.dart';

void main() {
  group('FavoritePage Integration Test', () {
    setUp(() {
      Get.testMode = true;
    });

    testWidgets('Renders FavoritePage', (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        home: FavoritePage(),
        initialBinding: FavoriteBinding(),
      ));

      expect(find.text('Favorites'), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);

      // Trigger a tap on the first item
      await tester.tap(find.byType(GestureDetector).first);
      await tester.pump(); // Rebuild the widget
    });

    testWidgets('Check the existence of UI elements',
        (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        home: FavoritePage(),
        initialBinding: FavoriteBinding(),
      ));

      expect(find.text('Favorites'), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      // Add more checks based on your UI structure
    });
  });
}
