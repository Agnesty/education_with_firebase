import 'dart:convert';

import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:education_app_with_firebase/services/loading_status.dart';
import 'package:education_app_with_firebase/services/references.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class PembahasanDataUploader extends GetxController {
  @override
  void onReady() {
    uploadData();
    super.onReady();
  }
  final loadingStatus = LoadingStatus.loading.obs;

  Future<void> uploadData() async {
    loadingStatus.value = LoadingStatus.loading;
    final fi = FirebaseFirestore.instance;

    //read asset folder
    final manifestContent = await DefaultAssetBundle.of(Get.context!)
        .loadString('AssetManifest.json');
    final Map<String, dynamic> manifestMap = json.decode(manifestContent);
    //seperate quiz json files
    final papersInAsset = manifestMap.keys
        .where((path) =>
            path.startsWith('assets/DB/pembahasan/') && path.contains('.json'))
        .toList();

    List<PembahasanPaperModel> pembahasanPapers = [];

    for (var paper in papersInAsset) {
      //read content of papers(json files)
      String stringPaperContent = await rootBundle.loadString(paper);

      //add data to model
      pembahasanPapers
          .add(PembahasanPaperModel.fromJson(json.decode(stringPaperContent)));
    }

    //upload data to firebase

    var batch = fi.batch();

    for (var paper in pembahasanPapers) {
      batch.set(pembahasanPaperFR.doc(paper.id), {
        "title": paper.title,
        "image_url": paper.imageUrl,
        "description": paper.description,
        "materi_count": paper.materi == null ? 0 : paper.materi!.length
      });

      for (var materi in paper.materi!) {
        final materiPath = materiFR(paperId: paper.id, materiId: materi.id);

        batch.set(materiPath, {
          "bab": materi.bab,
          "judulBab": materi.judulBab,
          "waktu": materi.judulBab,
          "imageBab": materi.imageBab
        });

        for (var penjelasann in materi.penjelasan) {
          batch.set(materiPath.collection('penjelasan').doc(penjelasann.id), {
            "penj1": penjelasann.penj1,
            "penj2": penjelasann.penj2,
            "penj3": penjelasann.penj3
          });
        }
      }
    }
    await batch.commit();
    loadingStatus.value = LoadingStatus.completed;
  }
}
