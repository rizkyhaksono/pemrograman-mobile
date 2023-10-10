import 'package:demo_mobile/presentation/dashboard/profile/profile_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfilePage extends GetView<ProfileController> {
  const ProfilePage({super.key});

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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "Profile",
                style: TextStyle(
                  fontFamily: Resources.font.primaryFont,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 150.0,
                height: 150.0,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Resources.color.darkGrey,
                    width: 3.0,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/profile.jpg',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 20,
          ),
          Text(
            'Rizky Haksono',
            style: TextStyle(
              color: Resources.color.hightlight,
              fontSize: 24.0,
              fontFamily: Resources.font.primaryFont,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Resources.color.darkGrey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                //
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Container(
            width: 300.0,
            height: 300.0,
            decoration: BoxDecoration(
              color: Resources.color.darkGrey,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              children: [
                //
              ],
            ),
          ),
        ],
      ),
    );
  }
}
