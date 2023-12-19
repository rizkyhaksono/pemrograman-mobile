import 'package:demo_mobile/routes/page_names.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:get/get.dart';
import 'package:integration_test/integration_test.dart';
import 'package:demo_mobile/main.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  testWidgets("MainApp displays UI elements", (WidgetTester tester) async {
    await tester.pumpWidget(const MainApp());

    expect(find.byType(const GetMaterialApp() as Type), findsOneWidget);
    expect(find.byType(GetMaterialApp), findsOneWidget);

    expect(Get.currentRoute, equals(PageName.splash));

    expect(find.text('Picvie'), findsOneWidget);
  });
}
