import 'package:cached_network_image/cached_network_image.dart';
import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:education_app_with_firebase/screens/pembahasan/videopreferrence/video_preference.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class videoWidget extends StatelessWidget {
  const videoWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final Materi model;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(VideoLandscapePreference.routeName, arguments: model);
      },
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          height: 130,
          margin: EdgeInsets.only(right: 10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)), color: Colors.yellow),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.only(top:20, left: 20, right: 5, bottom: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Part 1",
                      // model.judulBab,
                      style: TextStyle(
                          color: Color(0xff4d4d4d),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: Get.height * 0.4,
                width: Get.width * 0.4,
                child: CachedNetworkImage(
                    imageUrl: model.imgVi,
                    placeholder: (context, url) => Container(
                          alignment: Alignment.center,
                          child: const CircularProgressIndicator(),
                        ),
                    errorWidget: (context, url, error) =>
                        Image.asset("assets/images/Astronomi.png")),
              ),
              // Container(
              //   height: 90,
              //   width: 70,
              //   decoration: BoxDecoration(
              //       image: DecorationImage(
              //           image: AssetImage('assets/$img.png'), fit: BoxFit.contain)),
              // )
            ],
          ),
        ),
      ),
    );
  }
}