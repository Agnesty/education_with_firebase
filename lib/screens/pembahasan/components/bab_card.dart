import 'package:cached_network_image/cached_network_image.dart';
import 'package:education_app_with_firebase/controller/materi_ctr.dart';
import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:education_app_with_firebase/screens/pembahasan/pembahasan3_screen.dart';
import 'package:education_app_with_firebase/services/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BabCard extends GetView<MateriCtr> {
  final Materi model;

  const BabCard({
    Key? key,
    required this.model,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5,
      ),
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        child: InkWell(
          onTap: () {
            Get.toNamed(Pembahasan3Screen.routeName, arguments: model);
          },
          child: Container(
            margin: EdgeInsets.only(top: 5),
            height: 130,
            child: Stack(children: [
              Row(
                children: [
                  SizedBox(
                    height: Get.height * 0.34,
                    width: Get.width * 0.34,
                    child: CachedNetworkImage(
                        imageUrl: model.imageBab,
                        placeholder: (context, url) => Container(
                              alignment: Alignment.center,
                              child: const CircularProgressIndicator(),
                            ),
                        errorWidget: (context, url, error) =>
                            Image.asset("assets/images/Astronomi.png")),
                  ),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.all(15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                model.smt,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.deepPurple),
                              ),
                              Text(
                                model.bab,
                                style: TextStyle(
                                    fontSize: 10, color: Colors.deepPurple),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            model.judulBab,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
