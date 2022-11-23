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
  int timeSeconds;
  List<QuestionsLat>? questionsLat;
  List<QuestionsUji>? questionsUji;
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
      required this.questionsLat,
      required this.questionsUji,
      required this.timeSeconds,
      required this.penjelasan});

  Materi.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        angka = json['angka'] as String,
        title = json['title'] as String,
        bab = json['bab'] as String,
        judulBab = json['judulBab'] as String,
        imageBab = json['imageBab'] as String,
        smt = json['smt'] as String,
        nameVi = json['nameVi'] as String,
        imgVi = json['imgVi'] as String,
        urlVideo = json['urlVi'] as String,
        timeSeconds = json['time_seconds'] as int,
        questionsLat = json['questionsLat'] == null ? [] : (json['questionsLat'] as List)
            .map((dynamic e) => QuestionsLat.fromJson(e as Map<String, dynamic>))
            .toList(),
        questionsUji = json['questionsUji'] == null ? [] : (json['questionsUji'] as List)
            .map((dynamic e) => QuestionsUji.fromJson(e as Map<String, dynamic>))
            .toList(),
        // questionsLat = (json['questionsLat'] as List)
        //     .map((dynamic e) => QuestionsLat.fromJson(e as Map<String, dynamic>))
        //     .toList(),
        // questionsUji = (json['questionsUji'] as List)
        //     .map((dynamic e) => QuestionsUji.fromJson(e as Map<String, dynamic>))
        //     .toList(),
        // questionsUji = (json['penjelasan'] as List)
        //     .map((e) => QuestionsUji.fromJson(e))
        //     .toList(),
        // questionsLat = (json['penjelasan'] as List)
        //     .map((e) => QuestionsLat.fromJson(e))
        //     .toList(),
        // penjelasan = (json['penjelasan'] as List)
        //     .map((e) => Penjelasan.fromJson(e))
        //     .toList();
        penjelasan = (json['penjelasan'] as List)
            .map((dynamic e) => Penjelasan.fromJson(e as Map<String, dynamic>))
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
        timeSeconds = snapshot['time_seconds'],
        questionsLat = [],
        questionsUji = [],
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
    data['time_seconds'] = this.timeSeconds;
    if (this.penjelasan != null) {
      data['penjelasan'] = this.penjelasan.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class QuestionsLat {
  String id;
  String question;
  String? correctAnswer;
  List<Answer> answers;

  QuestionsLat(
      {required this.id,
      required this.question,
      this.correctAnswer,
      required this.answers});

  QuestionsLat.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        question = json['question'] as String,
        correctAnswer = json['correct_answer'] as String?,
        answers =
            (json['answers'] as List).map((e) => Answer.fromJson(e)).toList();

  QuestionsLat.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        question = snapshot['question'],
        answers = [],
        correctAnswer = snapshot['correct_answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Answer {
  String? identifier;
  String? answer;

  Answer({this.identifier, this.answer});

  Answer.fromJson(Map<String, dynamic> json)
      : identifier = json['identifier'] as String?,
        answer = json['Answer'] as String?;

  Answer.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : identifier = snapshot['identifier'] as String?,
        answer = snapshot['answer'] as String?;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['Answer'] = this.answer;
    return data;
  }

  // Map<String, dynamic> toJson() => {'identifier': identifier, 'Answer': answer};

}

class QuestionsUji {
  String id;
  String question;
  List<Answers> answers;
  String? correctAnswer;

  QuestionsUji(
      {required this.id,
      required this.question,
      required this.answers,
      this.correctAnswer});

  QuestionsUji.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        question = json['question'],
        correctAnswer = json['correct_answer'],
        answers =
            (json['answers'] as List).map((e) => Answers.fromJson(e)).toList();

  QuestionsUji.fromSnapshot(
      QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        question = snapshot['question'],
        answers = [],
        correctAnswer = snapshot['correct_answer'];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['question'] = this.question;
    data['correct_answer'] = this.correctAnswer;
    return data;
  }
}

class Answers {
  String? identifier;
  String? answer;

  Answers({this.identifier, this.answer});

  Answers.fromJson(Map<String, dynamic> json) {
    identifier = json['identifier'] as String?;
    answer = json['Answer'] as String?;
  }

  Answers.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : identifier = snapshot['identifier'] as String?,
        answer = snapshot['answer'] as String?;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['identifier'] = this.identifier;
    data['Answer'] = this.answer;
    return data;
  }
}

class Penjelasan {
  String id;
  String? penj;
  
  Penjelasan({
    required this.id,
    this.penj,
  });

  Penjelasan.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        penj = json['penj'];

  Penjelasan.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        penj = snapshot['penj1'] as String?;

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['penj'] = penj;
    return data;
  }
}
