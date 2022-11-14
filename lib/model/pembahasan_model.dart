import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:cloud_firestore/cloud_firestore.dart';

class PembahasanPaperModel {
  String id;
  String title;
  String? imageUrl;
  String description;
  List<Materi>? materi;
  int materiCount;

  PembahasanPaperModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.description,
      required this.materiCount,
      this.materi});

  PembahasanPaperModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String?,
        description = json['description'] as String,
        materiCount = 0,

        // will be update in PapersDataUploader
        materi = (json['materi'] as List)
            .map((dynamic e) => Materi.fromJson(e as Map<String, dynamic>))
            .toList();

  PembahasanPaperModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> json)
      : id = json.id,
        title = json['title'],
        imageUrl = json['image_url'],
        description = json['description'],
        materiCount = json['materi_count'],

        // will be update in PapersDataUploader
        materi = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['description'] = this.description;
    return data;
  }
}

class Materi {
  String id;
  String angka;
  String title;
  String bab;
  String judulBab;
  String imageBab;
  String smt;
  String imgVi;
  String nameVi;
  String urlVideo;
  List<Penjelasan> penjelasan;

  Materi(
      {required this.id,
      required this.angka,
      required this.title,
      required this.bab,
      required this.judulBab,
      required this.imageBab,
      required this.smt,
      required this.nameVi,
      required this.imgVi,
      required this.urlVideo,
      required this.penjelasan});

  Materi.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        angka = json['angka'] as String,
        title = json['id'] as String,
        bab = json['bab'] as String,
        judulBab = json['judulBab'] as String,
        imageBab = json['imageBab'] as String,
        smt = json['smt'] as String,
        nameVi = json['nameVi'] as String,
        imgVi = json['imgVi'] as String,
        urlVideo = json['urlVi'] as String,
        penjelasan = (json['penjelasan'] as List)
            .map((e) => Penjelasan.fromJson(e))
            .toList();

  Materi.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        angka = snapshot['angka'],
        title = snapshot['title'],
        bab = snapshot['bab'],
        judulBab = snapshot['judulBab'],
        imageBab = snapshot['imageBab'],
        smt = snapshot['smt'],
        nameVi = snapshot['nameVi'],
        imgVi = snapshot['imgVi'],
        urlVideo = snapshot['urlVi'],
        penjelasan = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['angka'] = this.angka;
    data['title'] = this.title;
    data['bab'] = this.bab;
    data['judulBab'] = this.judulBab;
    data['imageBab'] = this.imageBab;
    data['smt'] = this.smt;
    data['nameVi'] = this.nameVi;
    data['imgVi'] = this.imgVi;
    data['urlVi'] = this.urlVideo;
    if (this.penjelasan != null) {
      data['penjelasan'] = this.penjelasan.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Penjelasan {
  String id;
  String? penj1;
  String? penj2;
  String? penj3;

  Penjelasan({
    required this.id,
    this.penj1,
    this.penj2,
    this.penj3,
  });

  Penjelasan.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        penj1 = json['penj1'],
        penj2 = json['penj2'],
        penj3 = json['penj3'];

  Penjelasan.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        penj1 = snapshot['penj1'] as String?,
        penj2 = snapshot['penj2'] as String?,
        penj3 = snapshot['penj3'] as String?;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['penj1'] = penj1;
    data['penj2'] = penj2;
    data['penj3'] = penj3;
    return data;
  }
}
