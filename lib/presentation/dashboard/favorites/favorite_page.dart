import 'package:demo_mobile/presentation/dashboard/favorites/favorite_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FavoritePage extends GetView<FavoriteController> {
  FavoritePage({super.key});

  dynamic orientation, size, height, width;

  @override
  Widget build(BuildContext context) {
    orientation = MediaQuery.of(context).orientation;

    size = MediaQuery.of(context).size;
    height = size.height;
    width = size.width;

    return Scaffold(
      backgroundColor: Resources.color.background,
      body: ListView(
        scrollDirection: Axis.vertical,
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
              Text(
                "Favorites",
                style: TextStyle(
                  fontFamily: Resources.font.primaryFont,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                ),
              ),
            ],
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 14, 0, 18),
                child: SizedBox(
                  height: height / 1.3,
                  child: ListView.builder(
                    itemCount: controller.categoryList.length,
                    itemBuilder: (context, index) {
                      final movieName = controller.imageName[index];
                      final imageName = controller.imageList[index];
                      return GestureDetector(
                        onTap: () {
                          controller.handleRecentSelection(index);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(
                            right: 10,
                          ),
                          child: Container(
                            width: Get.width,
                            decoration: ShapeDecoration(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(8.0),
                                  child: Image.asset(
                                    imageName,
                                    width: Get.width,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Text(
                                  movieName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: Resources.font.primaryFont,
                                    fontSize: 18,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
