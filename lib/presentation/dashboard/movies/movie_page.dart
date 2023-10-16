import 'package:demo_mobile/components/card_movies.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviePage extends GetView<MovieController> {
  const MoviePage({super.key});

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
            children: [
              Text(
                "Movies",
                style: TextStyle(
                  fontFamily: Resources.font.primaryFont,
                  color: Colors.white,
                  fontWeight: FontWeight.w500,
                  fontSize: 32,
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 0),
            child: SizedBox(
              height: 650,
              child: ListView.builder(
                itemCount: controller.imageList.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  return Obx(
                    () {
                      final imageList = controller.imageList[index];
                      final imageName = controller.imageName[index];
                      return GestureDetector(
                        onTap: () {
                          // controller.handleImageList(index);
                          if (kDebugMode) {
                            print("clicked");
                          }
                        },
                        child: CardRecommend(
                          imagePath: imageList,
                          categoryName: imageName,
                          isSelected: controller.selectedIndex.toInt() == index,
                        ),
                      );
                    },
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
