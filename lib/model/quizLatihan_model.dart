import 'package:cloud_firestore/cloud_firestore.dart';

class QuizLatihanModel {
  String id;
  String title;
  String? imageUrl;
  List<Questions>? questions;
  int questionCount;

  QuizLatihanModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      this.questions,
      required this.questionCount});

  QuizLatihanModel.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        title = json['title'] as String,
        imageUrl = json['image_url'] as String,
        questionCount = 0,
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  QuizLatihanModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        title = snapshot['title'],
        imageUrl = snapshot['image_url'],
        questionCount = snapshot['question_count'] as int,
        questions = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['question_count'] = this.questionCount;
    return data;
  }
}

class Questions {
  String id;
  String question;
  String? correctAnswer;
  List<Answer> answers;

  Questions(
      {required this.id,
      required this.question,
      this.correctAnswer,
      required this.answers});

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        question = json['question'] as String,
        correctAnswer = json['correct_answer'] as String?,
        answers =
            (json['answers'] as List).map((e) => Answer.fromJson(e)).toList();

  Questions.fromSnapshot(QueryDocumentSnapshot<Map<String, dynamic>> snapshot)
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
}
