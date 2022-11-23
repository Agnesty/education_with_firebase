import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fi = FirebaseFirestore.instance;
final pembahasanPaperFR = fi.collection('pembahasan');
DocumentReference materiFR({
  required String paperId, 
  required String materiId
}) => pembahasanPaperFR.doc(paperId).collection('materi').doc(materiId);
DocumentReference questionFR({
  required String paperId,
  required String materiId, 
  required String questionId,
  required String answerId,
}) => pembahasanPaperFR.doc(paperId).collection('materi').doc(materiId).collection("questionsLat").doc(questionId).collection("answers").doc(answerId);

Reference get firebaseStorage => FirebaseStorage.instance.ref();
