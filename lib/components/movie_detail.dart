import 'package:demo_mobile/presentation/dashboard/movies/movie_controller.dart';
import 'package:demo_mobile/themes/resources.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MovieDetailPage extends GetView<MovieController> {
  const MovieDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                height: 200,
                width: Get.width,
                color: Resources.color.background,
                child: Image.asset("assets/images/illustration.png"),
              ),
              Positioned(
                top: 5,
                left: 10,
                child: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: Icon(
                    Icons.arrow_back_ios,
                    color: Colors.white,
                  ),
                ),
              ),
              // Positioned(
              //   top: 5,
              //   left: 10,
              //   child: IconButton(
              //     onPressed: () {
              //       print("favorited");
              //     },
              //     icon: Icon(
              //       Icons.favorite,
              //       color: Colors.white,
              //     ),
              //   ),
              // ),
              Positioned(
                bottom: 10,
                child: Text(
                  "Overview",
                  style: TextStyle(
                    fontSize: 22,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 10),
          Text("Hai")
        ],
      ),
    ));
  }
}
