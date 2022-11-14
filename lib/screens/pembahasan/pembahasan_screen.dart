import 'package:cached_network_image/cached_network_image.dart';
import 'package:education_app_with_firebase/controller/pembahasan_ctr.dart';
import 'package:education_app_with_firebase/screens/pembahasan/components/pembahasan_card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scroll_snap_list/scroll_snap_list.dart';

class PembahasanScreen extends StatelessWidget {
  const PembahasanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    PembahasanCtr _pembahasanCtr = Get.find();
    return Container(
      decoration: const BoxDecoration(
        color: Color.fromARGB(255, 120, 30, 255),
      ),
      child: Scaffold(
        body: SafeArea(
          child: Stack(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                    padding: const EdgeInsets.only(
                      top: 25,
                      right: 30,
                      left: 30,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                          const Text(
                              'Sekolah',
                              style: TextStyle(
                                fontFamily: 'Avenir',
                                fontSize: 35,
                                color: Colors.black,
                                fontWeight: FontWeight.w900,
                              ),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        ),
                        const Text(
                          'Sholeh',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 35,
                            color: Colors.black,
                            fontWeight: FontWeight.w900,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        Text(
                          'Materi Pelajaran',
                          style: TextStyle(
                            fontFamily: 'Avenir',
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ],
                    )),
                SizedBox(height: Get.height * 0.1),
                Expanded(
                  child: Obx(
                    () => ScrollSnapList(
                      itemSize: 200,
                      dynamicItemSize: true,
                      scrollDirection: Axis.horizontal,
                      onItemFocus: ((index) {}),
                      itemCount: _pembahasanCtr.allPapers.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PembahasanCard(
                          model: _pembahasanCtr.allPapers[index],
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
          ]),
        ),
      ),
    );
  }
}
