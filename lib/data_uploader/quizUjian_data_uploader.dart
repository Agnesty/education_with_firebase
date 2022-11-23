// import 'dart:convert';
// import 'package:education_app_with_firebase/model/quizLatihan_model.dart';
// import 'package:education_app_with_firebase/model/quizUjian_model.dart';
// import 'package:education_app_with_firebase/services/loading_status.dart';
// import 'package:education_app_with_firebase/services/references.dart';
// import 'package:flutter/material.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:flutter/services.dart';
// import 'package:get/get.dart';

// class QuizUjianDataUploader extends GetxController {
//   @override
//   void onReady() {
//     uploadData();
//     super.onReady();
//   }

//   final loadingStatus = LoadingStatus.loading.obs;

//   Future<void> uploadData() async {
//     loadingStatus.value = LoadingStatus.loading;
//     final fi = FirebaseFirestore.instance;

//     //read asset folder
//     final manifestContent = await DefaultAssetBundle.of(Get.context!)
//         .loadString('AssetManifest.json');
//     final Map<String, dynamic> manifestMap = json.decode(manifestContent);
//     //seperate quiz json files
//     final papersInAsset = manifestMap.keys
//         .where((path) =>
//             path.startsWith('assets/DB/ujian/') && path.contains('.json'))
//         .toList();

//     List<QuizUjianModel> quizUjianPapers = [];

//     for (var paper in papersInAsset) {
//       //read content of papers(json files)
//       String stringPaperContent = await rootBundle.loadString(paper);

//       //add data to model
//       quizUjianPapers
//           .add(QuizUjianModel.fromJson(json.decode(stringPaperContent)));
//     }

//     //upload data to firebase

//     var batch = fi.batch();

//     for (var paper in quizUjianPapers) {
//       batch.set(quizUjianFR.doc(paper.id), {
//         "title": paper.title,
//         "image_url": paper.imageUrl,
//         "time_seconds": paper.timeSeconds,
//         "question_count": paper.questions == null ? 0 : paper.questions!.length
//       });

//       for (var questions in paper.questions!) {
//         final questionPath =
//             quizUjiFR(paperId: paper.id, questionId: questions.id);

//         batch.set(questionPath, {
//           "question": questions.question,
//           "correct_answer": questions.correctAnswer
//         });

//         for (var answer in questions.answers) {
//           batch.set(questionPath.collection('answers').doc(answer.identifier), {
//             "identifier": answer.identifier,
//             "answer": answer.answer,
//           });
//         }
//       }
//     }
//     await batch.commit();
//     loadingStatus.value = LoadingStatus.completed;
//   }
// }
