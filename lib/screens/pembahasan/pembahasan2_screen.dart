import 'package:education_app_with_firebase/controller/materi_ctr.dart';
import 'package:education_app_with_firebase/controller/pembahasan_ctr.dart';
import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:education_app_with_firebase/screens/pembahasan/components/bab_card.dart';
import 'package:education_app_with_firebase/screens/pembahasan/components/content_area.dart';
import 'package:education_app_with_firebase/services/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';

class Pembahasan2Screen extends GetView<MateriCtr> {
  Pembahasan2Screen({Key? key}) : super(key: key) {
// SchedulerBinding.instance.addPostFrameCallback((d) {
//       final paper = Get.arguments as PembahasanPaperModel;
//     });
  }
  static String routeName = "/pembahasan2";
  
  //final PembahasanPaperModel _pembahasan;
  @override
  Widget build(BuildContext context) {
    MateriCtr _materiCtr = Get.find();
    return Scaffold(
      body: SafeArea(
        child: Obx(()=> Column(children: [
            if (controller.loadingStatus.value == LoadingStatus.loading)
              const Expanded(
                child: Center(child: CircularProgressIndicator()),
              ),
            if (controller.loadingStatus.value == LoadingStatus.completed)
              Expanded(
                  child: Stack(children: [
                Positioned(
                  top: 40,
                  right: 45,
                  child: Text(
                    controller.MateriObj.value!.angka,
                    style: TextStyle(
                      fontFamily: 'Avenir',
                      fontSize: 247,
                      color: Colors.amber.withOpacity(0.08),
                      fontWeight: FontWeight.w900,
                    ),
                    textAlign: TextAlign.left,
                  ),
                ),
                SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * 0.38),
                        Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(height: Get.height * 0.02),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 32),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    // "${Get.find<PembahasanCtr>().allPapers.value[0].title}",
                                    controller.MateriObj.value!.title,
                                    //  Get.arguments.title,
                                    
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 45,
                                      color: Color(0xFF414C6B),
                                      fontWeight: FontWeight.w900,
                                    ),
                                    textAlign: TextAlign.center,
                                  ),
                                  const Text(
                                    'Materi Pelajaran',
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 31,
                                      color: Color(0xFF414C6B),
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                  Divider(color: Colors.black38),
                                  SizedBox(height: 32),
                                  Text(
                                    "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
                                    maxLines: 5,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 20,
                                      color: Color(0xff868686),
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                  SizedBox(height: Get.height*0.05,),
                                  Text(
                                    'Materi',
                                    style: TextStyle(
                                      fontFamily: 'Avenir',
                                      fontSize: 25,
                                      color: const Color(0xff47455f),
                                      fontWeight: FontWeight.w300,
                                    ),
                                    textAlign: TextAlign.left,
                                  ),
                                ],
                              ),
                            ),
                            Flexible(
                              fit: FlexFit.loose,
                              child: Padding(
                                padding: const EdgeInsets.all(25.0),
                                child: Obx(
                                  () => ListView.builder(
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: _materiCtr.allMateri.length,
                                      scrollDirection: Axis.vertical,
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        return BabCard(
                                          model: _materiCtr.allMateri[index],
                                        );
                                      }),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                ),
                Positioned(
                  top: 10,
                  child: IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Get.back();
                    },
                  ),
                ),
              ]))
          ]),
        ),)
      
    );
  }
}
