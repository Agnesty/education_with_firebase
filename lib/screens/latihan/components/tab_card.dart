import 'package:cached_network_image/cached_network_image.dart';
import 'package:education_app_with_firebase/controller/pembahasan_ctr.dart';
import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TabCard extends StatelessWidget {
  final PembahasanPaperModel model1;

  const TabCard({
    Key? key,
    required this.model1,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    PembahasanCtr _pembahasanCtr = Get.find();
    return InkWell(
      onTap: () {
        
      },
      child: Stack(children: [
        Container(
          height: 160,
          width: 310,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(34),
              color: Color(0xFFFB475F).withOpacity(.06)),
          child: Row(
            children: <Widget>[
              // Rounded background
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Container(
                  height: 111,
                  width: 111,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFFFB475F).withOpacity(.15),
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  padding:
                      EdgeInsets.only(top: 25, bottom: 15, left: 8, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Semester 1",
                              style: TextStyle(
                                color: Color(0xFF1D150B).withOpacity(.4),
                              ),
                            ),
                            Spacer(),
                            Text(
                              "Bab 1",
                              style: TextStyle(
                                color: Color(0xFF1D150B).withOpacity(.4),
                              ),
                            ),
                          ]),
                      Spacer(),
                      Text(
                        "judulbab",
                        style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 14,
                        ),
                      ),
                      Spacer(
                        flex: 2,
                      ),
                      Row(
                        children: [
                          Text("50 menit"),
                          SizedBox(
                            width: 25,
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
       Positioned(
          top: -60,
          left: -5,
          child: SizedBox(
            height: Get.height*0.38,
            width: Get.width*0.38,
            child: CachedNetworkImage(
                imageUrl: model1.imageUrl!,
                placeholder: (context, url) => Container(
                      alignment: Alignment.center,
                      child: const CircularProgressIndicator(),
                    ),
                errorWidget: (context, url, error) =>
                    Image.asset("assets/images/Astronomi.png")),
          ),
        ),
      ]),
    );
  }
}
