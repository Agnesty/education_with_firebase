import 'package:education_app_with_firebase/services/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
  @override 
  void dependencies() {
     Get.lazyPut(() => FirebaseStorageService());
  }
}