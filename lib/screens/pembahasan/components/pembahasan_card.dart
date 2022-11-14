import 'package:cached_network_image/cached_network_image.dart';
import 'package:education_app_with_firebase/controller/pembahasan_ctr.dart';
import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:education_app_with_firebase/screens/pembahasan/pembahasan2_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PembahasanCard extends StatelessWidget {
  const PembahasanCard({super.key, required this.model});
  final PembahasanPaperModel model;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Column(
          children: [
            SizedBox(height: Get.height * 0.06),
            Container(
              width: 200,
              child: Card(
                elevation: 12,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(32),
                ),
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        SizedBox(height: 90),
                        Text(
                          model.title,
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 25,
                            color: const Color(0xff47455f),
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Pelajaran',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Color(0xFF414C6B),
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        SizedBox(height: 20),
                        Row(
                          children: <Widget>[
                            Text(
                              'Know more',
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 18,
                                color: Color(0xFFE4979E),
                                fontWeight: FontWeight.w500,
                              ),
                              textAlign: TextAlign.left,
                            ),
                            Icon(
                              Icons.arrow_forward,
                              color: Color(0xFFE4979E),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: -145,
          right: -10,
          child: GestureDetector(
            onTap: () {
              Get.toNamed(Pembahasan2Screen.routeName, arguments: model);
            },
            child: SizedBox(
              height: Get.height * 0.6,
              width: Get.width * 0.6,
              child: CachedNetworkImage(
                  imageUrl: model.imageUrl!,
                  placeholder: (context, url) => Container(
                        alignment: Alignment.center,
                        child: const CircularProgressIndicator(),
                      ),
                  errorWidget: (context, url, error) =>
                      Image.asset("assets/images/Astronomi.png")),
            ),
          ),
        ),
      ],
    );
  }
}
