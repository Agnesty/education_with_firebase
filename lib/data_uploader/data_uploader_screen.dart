import 'package:education_app_with_firebase/data_uploader/pembahasan_data_uploader.dart';
import 'package:education_app_with_firebase/data_uploader/quizLatihan_data_uploader.dart';
import 'package:education_app_with_firebase/data_uploader/quizUjian_data_uploader.dart';
import 'package:education_app_with_firebase/services/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DataUploaderScreen extends StatelessWidget {
  DataUploaderScreen({ Key? key }) : super(key: key);
  PembahasanDataUploader controller = Get.put(PembahasanDataUploader());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child:  Obx(()=> Text(controller.loadingStatus.value == LoadingStatus.completed? "Uploading Completed" : "uploading..."))
      ),
    );
  }
}