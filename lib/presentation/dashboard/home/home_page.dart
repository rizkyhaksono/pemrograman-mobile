import 'package:demo_mobile/presentation/dashboard/home/home_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.background,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 32,
          left: 20,
          right: 20,
        ),
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: "Hi, Rizky Haksono\n",
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: Resources.font.primaryFont,
                    fontWeight: FontWeight.w400,
                    fontSize: 14,
                  ),
                  children: [
                    WidgetSpan(
                      child: Text(
                        "Welcome to Picvie",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: Resources.font.primaryFont,
                          fontWeight: FontWeight.w600,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              IconButton(
                icon: Icon(
                  Icons.notifications_none_outlined,
                  color: Resources.color.hightlight,
                ),
                onPressed: () {
                  // Get.to(ProfilePage());
                  if (kDebugMode) {
                    print("notif clicked");
                  }
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
