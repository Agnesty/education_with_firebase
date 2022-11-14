import 'package:education_app_with_firebase/services/references.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseStorageService extends GetxService{
  Future<String?> getImage(String? imageName) async {
    if (imageName == null) return null;
    try{
      var urlref = firebaseStorage
          .child("img-matapelajaran")
          .child("${imageName.toLowerCase()}.png");
      var url = await urlref.getDownloadURL();
      return url;
    } catch (e) {
      print(e);
      return null;
    }
  }
}

// class FireBaseStorageService extends GetxController{
//    Future<String?> getImage(String? imageName) async {
//     if (imageName == null) return null;

//     try {
//       var urlref = firebaseStorage
//           .child('image_home_page')
//           .child('${imageName.toLowerCase()}.png');
//       var url = await urlref.getDownloadURL();
//       // final ref = firebaseStorage.child('${imageName.toLowerCase()}.png');
//       // var url = await ref.getDownloadURL();
//       // AppLogger.i(url);
//       return url;
//     } on Exception catch (e) {
//       print(e);
//       return null;
//     }
//   }
// }