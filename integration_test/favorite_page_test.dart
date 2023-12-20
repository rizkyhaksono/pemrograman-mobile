import 'package:demo_mobile/presentation/dashboard/favorites/favorite_binding.dart';
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

      await tester.tap(find.byType(GestureDetector).first);
      await tester.pump();
    });

    testWidgets('Check the existence of UI elements',
        (WidgetTester tester) async {
      await tester.pumpWidget(GetMaterialApp(
        home: FavoritePage(),
        initialBinding: FavoriteBinding(),
      ));

      expect(find.text('Favorites'), findsOneWidget);
      expect(find.byType(Scaffold), findsOneWidget);
    });
  });
}
