import 'package:demo_mobile/components/card_category.dart';
import 'package:demo_mobile/components/notification_bottom.dart';
import 'package:demo_mobile/presentation/dashboard/home/home_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:demo_mobile/utils/database_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<HomeController>();
    final DatabaseController databaseController =
        Get.find<DatabaseController>();

    final nowSoon = controller.nowSoon;

    if (nowSoon == null) {
      return Scaffold(
        backgroundColor: Resources.color.background,
        body: const Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    Iterable<int>? totalData = controller.nowSoon?.results.map((e) => e.id);
    List<int> totalDataTrending = totalData!.toList();

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
          Row(
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
          ),
          Row(
            children: [
              SizedBox(
                height: Get.height / 10,
              ),
              Flexible(
                child: SearchBar(
                  hintText: "Search...",
                  hintStyle: MaterialStateProperty.all(
                    TextStyle(
                      color: Colors.black,
                      fontFamily: Resources.font.primaryFont,
                    ),
                  ),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(10)))),
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
                  onTap: () {
                    // controller.openView();
                  },
                  onChanged: (_) {
                    // controller.openView();
                  },
                  onSubmitted: (value) {
                    if (kDebugMode) {
                      print("Hasil print:$value");
                    }
                  },
                  leading: const Icon(Icons.search),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 18),
            child: SizedBox(
              height: Get.height / 13,
              child: ListView.builder(
                itemCount: controller.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      final categoryName = controller.categoryList[index];
                      return GestureDetector(
                        onTap: () {
                          controller.handleCategorySelection(index);
                        },
                        child: CardCategory(
                          categoryName: categoryName,
                          isSelected: controller.selectedIndex.toInt() == index,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Trending",
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 18),
            child: SizedBox(
              height: 600,
              child: ListView.builder(
                itemCount: totalDataTrending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final dataImage =
                      controller.nowSoon?.results.map((e) => e.backdropPath);
                  final dataArray = dataImage?.toList();
                  final titleApi =
                      controller.nowSoon?.results.map((e) => e.title).toList();
                  final ratingApi = controller.nowSoon!.results
                      .map((e) => e.voteAverage)
                      .toList();
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
                          width: Get.width,
                          height: 530,
                          decoration: BoxDecoration(
                              color: Resources.color.hightlight,
                              borderRadius: BorderRadius.circular(20)),
                          child: Column(
                            children: [
                              Center(
                                child: ClipRRect(
                                  borderRadius: const BorderRadius.only(
                                    topLeft: Radius.circular(20),
                                    topRight: Radius.circular(20),
                                  ),
                                  child: Image.network(
                                    "https://image.tmdb.org/t/p/original${dataArray?[index]}",
                                    fit: BoxFit.cover,
                                    width: Get.width,
                                    height: 400,
                                  ),
                                ),
                              ),
                              Container(
                                margin: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                                height: 50,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 12),
                                child: Text(
                                  titleApi![index],
                                  style: TextStyle(
                                      color: Resources.color.hightlight,
                                      fontSize: 20),
                                ),
                              ),
                              const SizedBox(height: 8.0),
                              Container(
                                width: 120,
                                decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16, vertical: 8),
                                child: Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.yellow,
                                    ),
                                    const SizedBox(height: 8.0),
                                    Text(
                                      "${ratingApi[index]}/10",
                                      style: TextStyle(
                                        color: Resources.color.hightlight,
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 15, 0, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Now Playing",
                  style: TextStyle(
                    fontFamily: Resources.font.primaryFont,
                    fontSize: 24,
                    color: Colors.white,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Get.toNamed('/movies');
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
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 14, 0, 18),
            child: SizedBox(
              height: 600,
              child: ListView.builder(
                itemCount: totalDataTrending.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final dataImage =
                      controller.nowSoon?.results.map((e) => e.backdropPath);
                  final dataArray = dataImage!.toList();
                  final titleApi =
                      controller.nowSoon?.results.map((e) => e.title).toList();
                  final ratingApi = controller.nowSoon!.results
                      .map((e) => e.voteAverage)
                      .toList();
                  return GestureDetector(
                    onTap: () {
                      controller.handleRecentSelection(index);
                      if (kDebugMode) {
                        Get.toNamed('/movies-web');
                      }
                    },
                    child: Column(
                      children: [
                        SizedBox(
                          width: Get.width,
                          height: 530,
                          child: Container(
                            decoration: BoxDecoration(
                                color: Resources.color.hightlight,
                                borderRadius: BorderRadius.circular(20)),
                            child: Column(
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: const BorderRadius.only(
                                      topLeft: Radius.circular(20.0),
                                      topRight: Radius.circular(20.0),
                                    ),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/original${dataArray[index]}",
                                      fit: BoxFit.cover,
                                      width: Get.width,
                                      height: 400,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: const EdgeInsets.fromLTRB(0, 8, 0, 2),
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 12),
                                  child: Text(
                                    titleApi![index],
                                    style: TextStyle(
                                        color: Resources.color.hightlight,
                                        fontSize: 20),
                                  ),
                                ),
                                const SizedBox(height: 8.0),
                                Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 16, vertical: 8),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.star,
                                        color: Colors.yellow,
                                      ),
                                      const SizedBox(height: 8.0),
                                      Text(
                                        "${ratingApi[index]}/10",
                                        style: TextStyle(
                                          color: Resources.color.hightlight,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
