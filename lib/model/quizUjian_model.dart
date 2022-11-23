import 'package:cloud_firestore/cloud_firestore.dart';

class QuizUjianModel {
  String id;
  String title;
  String? imageUrl;
  int timeSeconds;
  int questionCount;
  List<Questions>? questions;

  QuizUjianModel(
      {required this.id,
      required this.title,
      this.imageUrl,
      required this.timeSeconds,
      this.questions,
      required this.questionCount});

  QuizUjianModel.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        title = json['title'] as String,
        imageUrl = json['image_url'] as String?,
        timeSeconds = json['time_seconds'] as int,
        questionCount = 0,
        questions = (json['questions'] as List)
            .map((dynamic e) => Questions.fromJson(e as Map<String, dynamic>))
            .toList();

  QuizUjianModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> snapshot)
      : id = snapshot.id,
        title = snapshot['title'],
        imageUrl = snapshot['image_url'],
        questionCount = snapshot['question_count'] as int,
        timeSeconds = snapshot['time_seconds'],
        questions = [];

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image_url'] = this.imageUrl;
    data['time_seconds'] = this.timeSeconds;
    data['question_count'] = this.questionCount;
    return data;
  }
}

class Questions {
  String id;
  String question;
  List<Answers> answers;
  String? correctAnswer;

  Questions(
      {required this.id,
      required this.question,
      required this.answers,
      this.correctAnswer});

  Questions.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String,
        question = json['question'],
        correctAnswer = json['correct_answer'],
        answers =
            (json['answers'] as List).map((e) => Answers.fromJson(e)).toList();

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
