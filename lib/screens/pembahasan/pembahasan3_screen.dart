import 'package:education_app_with_firebase/controller/materi_ctr.dart';
import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:education_app_with_firebase/screens/home/home_menu_screen.dart';
import 'package:education_app_with_firebase/screens/pembahasan/components/video_widget.dart';
import 'package:education_app_with_firebase/screens/pembahasan/videopreferrence/video_preference.dart';
import 'package:education_app_with_firebase/screens/quiz/quizLatihan/quiz_latihan_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Pembahasan3Screen extends GetView<MateriCtr> {
  const Pembahasan3Screen({super.key,});
  static String routeName = "/pembahasan3";

  @override
  Widget build(BuildContext context) {
    MateriCtr _materiCtr = Get.find();
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: Icon(
                  Icons.home,
                  color: Colors.black,
                  size: 30,
                ),
                onPressed: () {
                  Get.toNamed(HomeScreen.routeName);
                },
              ),
            ),
          ]),
      body: Obx(() => Column(
        children: [
          Expanded(
            child: Container(
              width: MediaQuery.of(context).size.width,
              color: Colors.white,
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          // Get.arguments.judulBab,
                          controller.MateriObj.value!.judulBab,
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 20,
                              fontFamily: 'product'),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "   I have been a teacher as well as a director in the child care setting since the early 2000’s. I love working with children and watching them grow. My pholosophy is children learn through play with teacher guidance and children choices.",
                            style: TextStyle(
                              fontFamily: 'circe',
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Padding(
                                padding: const EdgeInsets.all(12.0),
                                child: AspectRatio(
                                    aspectRatio: 6 / 3,
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(20),
                                        child: Material(
                                            child: Ink.image(
                                                image: NetworkImage(
                                                    "https://img.freepik.com/free-vector/flat-back-school-illustration-with-students_23-2149479538.jpg?w=740&t=st=1663805157~exp=1663805757~hmac=c71774fc5f63d188e5d377cd512f55717a075a2361c63ff3aedd1ef0306b2e54'"),
                                                fit: BoxFit.cover,
                                                child: InkWell(
                                                  onTap: () {},
                                                )))))),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "   I have been a teacher as well as a director in the child care setting since the early 2000’s. I love working with children and watching them grow. My pholosophy is children learn through play with teacher guidance and children choices.",
                            style: TextStyle(
                              fontFamily: 'circe',
                              fontSize: 17,
                            ),
                            textAlign: TextAlign.justify,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Text(
                            "Belajar dari Video",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 17,
                                fontFamily: 'product'),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 220,
                      width: double.maxFinite,
                      child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: 1,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (BuildContext context, int index) {
                              return 
                              VideoLandscapePreference(
                                model: _materiCtr.allMateri[index],
                              );
                              // videoWidget(
                              //   model: _materiCtr.allMateri[index],
                              // );
                            }),
                      ),
                    
                    // Container(
                    //   height: 150,
                    //   width: double.maxFinite,
                    //   child: SingleChildScrollView(
                    //     scrollDirection: Axis.horizontal,
                    //     child: Row(
                    //       children: [
                    //         videoWidget(img: "earth", name: "Young \nLearners", grade: "GRADE 0-1", color: Colors.deepOrange, textColor: Colors.black),
                    //         videoWidget(img: "jupiter", name: "Creative \nBloomers", grade: "GRADE 0-2", color: Colors.yellow, textColor: Color(0xff4d4d4d)),
                    //         videoWidget(img: "mars", name: "Early \nAchievers", grade: "GRADE 0-3", color: Colors.amber, textColor: Color(0xff4a155f))
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    SizedBox(
                      height: 10,
                    ),
                  ],
                ),
              ),
            ),
          ),
          Container(
            color: Colors.white,
            child: InkWell(
              onTap: () {
                Get.toNamed(QuizLatihanScreen.routeName);
              },
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(bottom: 20, right: 30, left: 30),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.deepPurple),
                child: Center(
                  child: Text(
                    "Latihan Soal Yuk!",
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'circe',
                        fontWeight: FontWeight.w700,
                        fontSize: 18),
                  ),
                ),
              ),
            ),
          )
        ],
      ),)
    );
  }
}
