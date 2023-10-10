import 'package:demo_mobile/components/bottom_navbar.dart';
import 'package:demo_mobile/presentation/dashboard/dashboard_controller.dart';
import 'package:demo_mobile/presentation/dashboard/favorites/favorite_page.dart';
import 'package:demo_mobile/presentation/dashboard/home/home_page.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_page.dart';
import 'package:demo_mobile/presentation/dashboard/profile/profile_page.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DashboardPage extends GetView<DashboardController> {
  const DashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<DashboardController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Resources.color.background,
          body: SafeArea(
            child: IndexedStack(
              index: controller.tabIndex,
              children: [
                HomePage(),
                MoviePage(),
                FavoritePage(),
                ProfilePage(),
              ],
            ),
          ),
          bottomNavigationBar: BottomNavigationBar(
            unselectedItemColor: Colors.white60,
            selectedItemColor: Resources.color.hightlight,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex,
            showSelectedLabels: true,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            backgroundColor: Resources.color.background,
            landscapeLayout: BottomNavigationBarLandscapeLayout.centered,
            selectedLabelStyle: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w300,
              fontFamily: Resources.font.primaryFont,
            ),
            elevation: 8,
            items: [
              bottomNavbar(
                icon: Icons.home_filled,
                label: 'Home',
              ),
              bottomNavbar(
                icon: Icons.local_movies_outlined,
                label: 'Movies',
              ),
              bottomNavbar(
                icon: Icons.favorite_rounded,
                label: 'Favorites',
              ),
              bottomNavbar(
                icon: Icons.person_rounded,
                label: 'Profile',
              ),
            ],
          ),
        );
      },
    );
  }
}
