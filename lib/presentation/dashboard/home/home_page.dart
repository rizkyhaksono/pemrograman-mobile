import 'package:demo_mobile/components/card_category.dart';
import 'package:demo_mobile/components/notification_bottom.dart';
import 'package:demo_mobile/models/movie_discover.dart' as MovieDiscoverModel;
import 'package:demo_mobile/models/tv_discover.dart' as TVDiscoverModel;
import 'package:demo_mobile/presentation/dashboard/home/home_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:demo_mobile/utils/database_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    HomeController homeController = HomeController();

    return Scaffold(
      backgroundColor: Resources.color.background,
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(
          top: 40,
          left: 20,
          right: 20,
        ),
        children: <Widget>[
          buildUserInfoRow(context),
          buildSearchBar(),
          buildCategoryList(homeController),
          buildSectionHeader("Movie Discover"),
          buildMovieList(controller, controller.movieDiscover?.results),
          buildSectionHeader("TV Discover"),
          buildTvList(controller, controller.tvDiscover?.results),
        ],
      ),
    );
  }
}

Widget buildUserInfoRow(BuildContext context) {
  final DatabaseController databaseController = Get.find<DatabaseController>();
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Obx(
        () => Text.rich(
          TextSpan(
            text:
                "Hi, ${databaseController.documents.isNotEmpty ? databaseController.documents[0].data['name'] ?? '' : ''}\n",
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
      ),
      IconButton(
        icon: Icon(
          Icons.notifications_none_outlined,
          color: Resources.color.hightlight,
        ),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20.0),
                topRight: Radius.circular(20.0),
              ),
            ),
            backgroundColor: Resources.color.background,
            builder: (context) => notifSheet(context),
          );
          if (kDebugMode) {
            print("notif clicked");
          }
        },
      ),
    ],
  );
}

Widget buildSearchBar() {
  return Padding(
    padding: const EdgeInsets.only(top: 15),
    child: SearchBar(
      hintText: "Search...",
      hintStyle: MaterialStateProperty.all(
        TextStyle(
          color: Colors.black,
          fontFamily: Resources.font.primaryFont,
        ),
      ),
      shape: MaterialStateProperty.all(
        const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
      ),
      textStyle: MaterialStateProperty.all(
        TextStyle(
          color: Colors.black,
          fontFamily: Resources.font.primaryFont,
        ),
      ),
      backgroundColor: MaterialStateProperty.all(
        Resources.color.hightlight,
      ),
      padding: const MaterialStatePropertyAll<EdgeInsets>(
        EdgeInsets.symmetric(horizontal: 20.0),
      ),
      onSubmitted: (value) {
        if (kDebugMode) {
          print("Hasil print:$value");
        }
      },
      leading: const Icon(Icons.search),
    ),
  );
}

Widget buildCategoryList(HomeController controller) {
  return Padding(
    padding: const EdgeInsets.only(top: 14, bottom: 18),
    child: SizedBox(
      height: Get.height / 13,
      child: ListView.builder(
        itemCount: controller.categoryList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movieCategory = controller.categoryList[index];
          final categoryName = movieCategory.name;

          return Obx(
            () => GestureDetector(
              onTap: () => controller.handleCategorySelection(index),
              child: CardCategory(
                categoryName: categoryName,
                isSelected: controller.selectedIndex.toInt() == index,
              ),
            ),
          );
        },
      ),
    ),
  );
}

Widget buildSectionHeader(String title) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
            fontFamily: Resources.font.primaryFont,
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.w600,
          ),
        ),
        TextButton(
          onPressed: () {
            if (kDebugMode) {
              print("See all");
            }
          },
          child: Text(
            "See all",
            style: TextStyle(
              fontFamily: Resources.font.primaryFont,
              fontSize: 14,
              decoration: TextDecoration.underline,
              color: Resources.color.hightlight,
              fontWeight: FontWeight.w600,
            ),
          ),
        )
      ],
    ),
  );
}

Widget buildMovieList(
    HomeController controller, List<MovieDiscoverModel.Result>? movieResults) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 14, 0, 18),
    child: SizedBox(
      height: 600,
      child: ListView.builder(
        itemCount: movieResults?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final movieResult = movieResults?[index];
          final backdropPath = movieResult?.backdropPath ?? '';
          final title = movieResult?.title ?? '';
          final rating = movieResult?.voteAverage ?? '0';

          return GestureDetector(
            onTap: () {
              controller.handleRecentSelection(index);
              if (kDebugMode) {
                Get.toNamed('/movies-web');
              }
            },
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25, right: 40),
                  width: Get.width / 1.2,
                  height: 530,
                  decoration: BoxDecoration(
                    color: Resources.color.hightlight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/original$backdropPath",
                            fit: BoxFit.cover,
                            width: Get.width,
                            height: 400,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                        height: 50,
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 12,
                        ),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Resources.color.background,
                            fontSize: 24,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 16,
                          vertical: 8,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Resources.color.background,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Resources.color.background,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}

Widget buildTvList(
    HomeController controller, List<TVDiscoverModel.Result>? tvResults) {
  return Padding(
    padding: const EdgeInsets.fromLTRB(0, 14, 0, 18),
    child: SizedBox(
      height: 600,
      child: ListView.builder(
        itemCount: tvResults?.length ?? 0,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          final tvResult = tvResults?[index];
          if (tvResult == null) {
            return SizedBox.shrink(); // Skip if tvResult is null
          }
          final backdropPath = tvResult.backdropPath ?? '';
          final title = tvResult.name ?? '';
          final rating = tvResult.voteAverage ?? '0';

          return GestureDetector(
            onTap: () {
              controller.handleRecentSelection(index);
              if (kDebugMode) {
                Get.toNamed('/movies-web');
              }
            },
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 25, right: 40),
                  width: Get.width / 1.2,
                  height: 530,
                  decoration: BoxDecoration(
                    color: Resources.color.hightlight,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    children: [
                      Center(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20),
                          ),
                          child: Image.network(
                            "https://image.tmdb.org/t/p/original$backdropPath",
                            fit: BoxFit.cover,
                            width: Get.width,
                            height: 400,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                        height: 50,
                        child: Text(
                          title,
                          style: TextStyle(
                            color: Resources.color.background,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w500,
                            fontSize: 24,
                          ),
                        ),
                      ),
                      const SizedBox(height: 8.0),
                      SizedBox(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.star,
                              color: Resources.color.background,
                            ),
                            const SizedBox(height: 8.0),
                            Text(
                              rating.toString(),
                              style: TextStyle(
                                color: Resources.color.background,
                                fontSize: 24,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    ),
  );
}
