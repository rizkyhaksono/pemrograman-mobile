// package flutter
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// getx
import 'package:get/get.dart';

// page
import 'package:demo_mobile/routes/page_names.dart';
import 'package:demo_mobile/routes/page_routes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: PageName.splash,
      getPages: PageRoutes.pages,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      themeMode: ThemeMode.system,
      // locale: const Locale('en', 'EN'),
      routingCallback: (value) {
        SystemChrome.setSystemUIOverlayStyle(
            SystemUiOverlayStyle(statusBarColor: Resources.color.background));
      },
      builder: (BuildContext context, child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
          child: child ?? Container(),
        );
      },
    );
  }
}
