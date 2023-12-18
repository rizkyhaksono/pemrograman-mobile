import 'package:demo_mobile/models/all_trending.dart';
import 'package:demo_mobile/presentation/dashboard/movies/movie_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MoviePage extends GetView<MovieController> {
  MoviePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Resources.color.background,
      body: Obx(
        () {
          if (controller.isLoading.isTrue) {
            return const Center(child: CircularProgressIndicator());
          } else if (controller.hasError.isTrue) {
            return Center(child: Text("Error: ${controller.errorMessage}"));
          } else if (controller.hasData.isTrue) {
            return buildMoviePageContent(controller);
          } else {
            return const SizedBox.shrink();
          }
        },
      ),
    );
  }

  Widget buildMoviePageContent(MovieController controller) {
    return ListView(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        top: 32,
        left: 20,
        right: 20,
      ),
      children: <Widget>[
        if (controller.hasData.isTrue)
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Trending',
                style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.w500,
                    fontFamily: "Poppins",
                    color: Colors.white),
              ),
              const SizedBox(height: 16),
              buildMovieItem(controller.allTrending?.results),
            ],
          ),
      ],
    );
  }

  Widget buildMovieItem(List<Result>? results) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: results?.length ?? 0,
        itemBuilder: (context, index) {
          var result = results![index];
          print("Total data: ${results.length}");

          return GestureDetector(
            onTap: () {
              print("halo");
            },
            child: Container(
              margin: const EdgeInsets.only(bottom: 16),
              child: Text(
                result.title ?? 'No Title',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
