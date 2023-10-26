import 'package:demo_mobile/components/card_category.dart';
import 'package:demo_mobile/components/card_recent.dart';
import 'package:demo_mobile/presentation/dashboard/home/home_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomePage extends GetView<HomeController> {
  HomePage({super.key});

  dynamic orientation, size, height, width;

  @override
  Widget build(BuildContext context) {
    // getting the orientation of the app
    orientation = MediaQuery.of(context).orientation;

    // size of the screen
    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

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
                height: height / 9,
              ),
              Flexible(
                child: SearchBar(
                  hintText: "Search...",
                  hintStyle: MaterialStateProperty.all(
                    TextStyle(
                      color: Colors.black38,
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
              height: height / 14,
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
                  "Recent",
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
              height: height / 2.5,
              child: ListView.builder(
                itemCount: controller.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final movieName = controller.imageName[index];
                  final imageName = controller.imageList[index];
                  return GestureDetector(
                    onTap: () {
                      controller.handleRecentSelection(index);
                      // if (kDebugMode) {
                      //   print("object");
                      // }
                    },
                    child: CardRecent(
                      recentName: movieName,
                      imageName: imageName,
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
                  "Recommended",
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
              height: height / 2.5,
              child: ListView.builder(
                itemCount: controller.categoryList.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  final movieName = controller.imageName[index];
                  final imageName = controller.imageList[index];
                  return GestureDetector(
                    onTap: () {
                      // controller.handleRecentSelection(index);
                      if (kDebugMode) {
                        print("object");
                      }
                    },
                    child: CardRecent(
                      recentName: movieName,
                      imageName: imageName,
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

  Widget notifSheet(BuildContext context) {
    return Container(
      width: Get.width,
      color: Resources.color.background,
      height: Get.height,
      padding: const EdgeInsets.all(16.0),
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: ListView(
        children: [
          Column(
            children: [
              Text(
                "Choose Profile Photo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Resources.color.hightlight,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("test");
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('test');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                "Choose Profile Photo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Resources.color.hightlight,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("test");
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('test');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                "Choose Profile Photo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Resources.color.hightlight,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("test");
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('test');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                "Choose Profile Photo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Resources.color.hightlight,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("test");
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('test');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                "Choose Profile Photo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Resources.color.hightlight,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("test");
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('test');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
              Text(
                "Choose Profile Photo",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Resources.color.hightlight,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  GestureDetector(
                    onTap: () {
                      print("test");
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.image,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Gallery",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      print('test');
                    },
                    child: Column(
                      children: [
                        Icon(
                          Icons.camera,
                          color: Resources.color.hightlight,
                          size: 30,
                        ),
                        const SizedBox(height: 10),
                        Text(
                          "Camera",
                          style: TextStyle(
                            fontSize: 18,
                            color: Resources.color.hightlight,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ],
      ),
    );
  }
}
