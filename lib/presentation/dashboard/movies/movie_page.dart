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
                      final dataImage =
                          controller.up_soon.results.map((e) => e.backdropPath);
                      final dataArray = dataImage;
                      late Iterable<String> titleApi =
                          controller.up_soon.results.map((e) => e.title);
                      return GestureDetector(
                        onTap: () {
                          // controller.handleImageList(index);
                          Get.toNamed('/movie_detail');
                          if (kDebugMode) {
                            print("clicked");
                          }
                        },
                        child: CardRecommend(
                          imagePath: dataArray,
                          categoryName: titleApi,
                          isSelected: controller.selectedIndex.toInt() == index,
                        ),
                      );
                    },
                  );
                },
              ),
            ),
          ),
          // Text(controller.up_soon.results.map((e) => e.title.toString()).first),
          // Text(controller.up_soon.results[1].posterPath.toString()),
          Text(controller.up_soon.results.map((e) => e.title).toString()),
          Text(
              controller.up_soon.results.map((e) => e.backdropPath).toString()),
          // Image.network("https://api.themoviedb.org/3" +
          //     controller.up_soon.results[1].posterPath.toString() +
          //     "&api_key=8ee16750c566b88be3d29a700cff3e73")
          Image.network(
              'https://image.tmdb.org/t/p/original//t5zCBSB5xMDKcDqe91qahCOUYVV.jpg')
        ],
      ),
    );
  }
}
