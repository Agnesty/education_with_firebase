import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:education_app_with_firebase/services/loading_status.dart';
import 'package:education_app_with_firebase/services/references.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MateriCtr extends GetxController {
  final loadingStatus = LoadingStatus.loading.obs;
  late PembahasanPaperModel pembahasanPaperModel;
  final allMateri = <Materi>[].obs;
  Rxn<Materi> MateriObj = Rxn<Materi>();

  @override
  void onReady() {
    final _materiPaper = Get.arguments as PembahasanPaperModel;
    print(_materiPaper.id);
    loadData(_materiPaper);
    super.onReady();
  }

  Future<void> loadData(PembahasanPaperModel materiPaper) async {
    pembahasanPaperModel = materiPaper;
    loadingStatus.value = LoadingStatus.loading;

    try {
      final QuerySnapshot<Map<String, dynamic>> materiQuery =
          await pembahasanPaperFR
              .doc(materiPaper.id)
              .collection("materi")
              .get();
      final materi = materiQuery.docs
          .map((materi) => Materi.fromSnapshot(materi))
          .toList();
      materiPaper.materi = materi;

      for (Materi _materi in materiPaper.materi!) {
        final QuerySnapshot<Map<String, dynamic>> penjelasanQuery =
            await pembahasanPaperFR
                .doc(materiPaper.id)
                .collection("materi")
                .doc(_materi.id)
                .collection("penjelasan")
                .get();
        final penjelasan = penjelasanQuery.docs
            .map((penjelasan) => (Penjelasan.fromSnapshot(penjelasan)))
            .toList();
        _materi.penjelasan = penjelasan;
        if (materiPaper.materi != null && materiPaper.materi!.isNotEmpty) {
          allMateri.assignAll(materiPaper.materi!);
          MateriObj.value = materiPaper.materi![0];
          if(kDebugMode){
            print(materiPaper.materi![0].title);
          }
          loadingStatus.value = LoadingStatus.completed;
        } else {
          loadingStatus.value = LoadingStatus.error;
        }
      }
      // allMateri.assignAll(materiPaper.materi!);
      // loadingStatus.value = LoadingStatus.completed;
    } catch (e) {
      if(kDebugMode){
        print(e.toString());
      }
      print(e);
    }
  }
}
