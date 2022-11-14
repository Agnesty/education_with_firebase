import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

final fi = FirebaseFirestore.instance;
final pembahasanPaperFR = fi.collection('pembahasan');
DocumentReference materiFR({
  required String paperId, 
  required String materiId
}) => pembahasanPaperFR.doc(paperId).collection('materi').doc(materiId);

Reference get firebaseStorage => FirebaseStorage.instance.ref();
