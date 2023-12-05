import 'package:demo_mobile/presentation/dashboard/movies/movie_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviePage extends GetView<MovieController> {
  const MoviePage({super.key});

  @override
  Widget build(BuildContext context) {
    final totalData = controller.upSoon!.results.map((e) => e.backdropPath);
    final totalDataMovies = totalData.toList();

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
                "Movies Latest",
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
                itemCount: totalDataMovies.length,
                scrollDirection: Axis.vertical,
                itemBuilder: (context, index) {
                  final dataImage =
                      controller.upSoon!.results.map((e) => e.backdropPath);
                  final dataArray = dataImage.toList();
                  final titleApi =
                      controller.upSoon!.results.map((e) => e.title).toList();
                  final ratingApi = controller.upSoon!.results
                      .map((e) => e.voteAverage)
                      .toList();

                  return GestureDetector(
                    onTap: () {
                      Get.toNamed('/movies-web');
                      if (kDebugMode) {
                        print("clicked");
                      }
                    },
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.only(top: 25),
                          width: Get.width,
                          height: 530,
                          decoration: BoxDecoration(
                              color: Resources.color.hightlight,
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            padding: const EdgeInsets.only(top: 10),
                            child: Column(
                              children: [
                                Center(
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(20.0),
                                    child: Image.network(
                                      "https://image.tmdb.org/t/p/original${dataArray[index]}",
                                      fit: BoxFit.cover,
                                      width: 330,
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
                                    titleApi[index],
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
