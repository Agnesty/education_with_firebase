import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:education_app_with_firebase/services/firebase_storage.dart';
import 'package:education_app_with_firebase/services/references.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PembahasanCtr extends GetxController {
  final allPaperImages = <String>[].obs;
  final allPapers = <PembahasanPaperModel>[].obs;
  
  @override
  void onReady() {
    getAllPapers();
    super.onReady();
  }


  Future<void> getAllPapers() async {
    List<String> imageName = ["ipa", "matematika"];

    try {
      QuerySnapshot<Map<String, dynamic>> data = await pembahasanPaperFR.get();
      final paperList = data.docs
          .map((paper) => PembahasanPaperModel.fromSnapshot(paper))
          .toList();
      allPapers.assignAll(paperList);

      for (var paper in paperList) {
        final url =
            await Get.find<FirebaseStorageService>().getImage(paper.title);
        paper.imageUrl = url;
      }
      allPapers.assignAll(paperList);
    } catch (e) {
      print(e);
    }
  }
}

// class PembahasanCtr extends GetxController {
//   final allPaperImages = <String>[].obs;

//   @override
//   void onReady() {
//     getAllPapers();
//     super.onReady();
//   }

//   Future<void> getAllPapers() async {
//     List<String> imageName = ["ipa", "matematika"];

//     try {

//       for (var img in imageName) {
//         final url = await Get.find<FirebaseStorageService>().getImage(img);
//         allPaperImages.add(url!);
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
// }
