import 'package:education_app_with_firebase/controller/materi_ctr.dart';
import 'package:education_app_with_firebase/controller/quizLat_ctr.dart';
import 'package:education_app_with_firebase/model/pembahasan_model.dart';
import 'package:education_app_with_firebase/services/loading_status.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizLatihanScreen extends GetView<MateriCtr> {
  const QuizLatihanScreen({
    Key? key,
  }) : super(key: key);
  static String routeName = "/quizlatihanscreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(children: [
          if (controller.loadingStatus.value == LoadingStatus.loading)
            const Expanded(child: Center(child: CircularProgressIndicator())),
          if (controller.loadingStatus.value == LoadingStatus.completed)
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(top: 20),
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        controller.MateriObj.value!.judulBab,
                      ),
                    ),
                    // GetBuilder<QuizController>(
                    //     id: 'answers_list',
                    //     builder: (context) {
                    //       return ListView.separated(
                    //         itemCount: controller
                    //             .currentQuestion.value!.answers.length,
                    //         shrinkWrap: true,
                    //         padding: const EdgeInsets.only(top: 25),
                    //         physics: const NeverScrollableScrollPhysics(),
                    //         separatorBuilder:
                    //             (BuildContext context, int index) {
                    //           return const SizedBox(
                    //             height: 10,
                    //           );
                    //         },
                    //         itemBuilder: (BuildContext context, int index) {
                    //           final answer = controller
                    //               .currentQuestion.value!.answers[index];
                    //           return AnswerCard(
                    //             isSelected: answer.identifier ==
                    //                 controller.currentQuestion.value!
                    //                     .selectedAnswer,
                    //             onTap: () {
                    //               controller
                    //                   .selectAnswer(answer.identifier);
                    //             },
                    //             answer:
                    //                 '${answer.identifier}. ${answer.answer}',
                    //           );
                    //         },
                    //       );
                    //     }),
                  ],
                ),
              ),
            ),
        ]),
        //     ColoredBox(
        //       color: Theme.of(context).scaffoldBackgroundColor,
        //       child: Padding(
        //         padding: UIParameters.screenPadding,
        //         child: Row(
        //           children: [
        //             Visibility(
        //               visible: controller.isFirstQuestion,
        //               child: Padding(
        //                 padding: const EdgeInsets.only(right: 5.0),
        //                 child: SizedBox(
        //                   height: 55,
        //                   width: 55,
        //                   child: MainButton(
        //                     onTap: () {
        //                       controller.prevQuestion();
        //                     },
        //                     child: const Icon(Icons.arrow_back_ios_new),
        //                   ),
        //                 ),
        //               ),
        //             ),
        //             Expanded(
        //               child: Obx(
        //                 () => Visibility(
        //                   visible: controller.loadingStatus.value ==
        //                       LoadingStatus.completed,
        //                   child: MainButton(
        //                     onTap: () {
        //                       controller.islastQuestion
        //                           ? Get.toNamed(QuizOverviewScreen.routeName)
        //                           : controller.nextQuestion();
        //                     },
        //                     title:
        //                         controller.islastQuestion ? 'Complete' : 'Next',
        //                   ),
        //                 ),
        //               ),
        //             )
        //           ],
        //         ),
        //       ),

        //   ],
        // ),
      ),
    );

    // return FutureBuilder(
    //   future: _questions as Future<List<Question>>,
    //   builder: (ctx, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.done) {
    //       if (snapshot.hasError) {
    //         return Center(
    //           child: Text('${snapshot.error}'),
    //         );
    //       } else if (snapshot.hasData) {
    //         var extractedData = snapshot.data as List<Question>;
    //         return WillPopScope(
    //           onWillPop: () async {
    //             final value = await showDialog<bool>(
    //                 context: context,
    //                 builder: (context) {
    //                   return AlertDialog(
    //                     title: const Text('Sebentar!',
    //                         style: TextStyle(fontWeight: FontWeight.bold)),
    //                     content: const Text(
    //                         'Kamu yakin ingin keluar? Semua jawabanmu akan hilang jika kamu keluar.'),
    //                     actions: [
    //                       ElevatedButton(
    //                           onPressed: () => Navigator.of(context).pop(false),
    //                           child: const Text('Tidak')),
    //                       ElevatedButton(
    //                           onPressed: () => Navigator.of(context).pop(true),
    //                           child: const Text('Keluar'))
    //                     ],
    //                   );
    //                 });
    //             if (value != null) {
    //               return Future.value(value);
    //             } else {
    //               return Future.value(false);
    //             }
    //           },
    //           child: Scaffold(
    //             backgroundColor: Colors.white,
    //             appBar: AppBar(
    //               title: const Text(
    //                 'Latihan Soal',
    //                 style: TextStyle(color: Colors.white),
    //               ),
    //               // centerTitle: true,
    //               backgroundColor: Colors.orange,
    //               elevation: 0,
    //               actions: [
    //                 Padding(
    //                   padding: const EdgeInsets.all(18),
    //                   child: Text(
    //                     'Benar : $score',
    //                     style: const TextStyle(fontSize: 18),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             body: Stack(children: [
    //               Container(
    //                 height: 150,
    //                 decoration: BoxDecoration(
    //                     color: Colors.orange,
    //                     borderRadius: BorderRadius.only(
    //                         bottomLeft: Radius.circular(20),
    //                         bottomRight: Radius.circular(20))),
    //               ),
    //               Container(
    //                 width: double.infinity,
    //                 padding: const EdgeInsets.symmetric(horizontal: 10),
    //                 child: Column(
    //                   children: [
    //                     const SizedBox(height: 25),
    //                     Row(
    //                       children: [
    //                         CircleAvatar(
    //                           backgroundColor: Colors.orange,
    //                           child: Text(
    //                             "${index + 1}.",
    //                             style: TextStyle(
    //                                 fontSize: 22, color: Colors.white),
    //                           ),
    //                         ),
    //                         SizedBox(width: 5),
    //                         Expanded(
    //                           child: QuestionWidget(
    //                             question: extractedData[index].title,
    //                           ),
    //                         ),
    //                       ],
    //                     ),
    //                     const SizedBox(height: 110),
    //                     for (int i = 0;
    //                         i < extractedData[index].options.length;
    //                         i++)
    //                       GestureDetector(
    //                         onTap: () => checkAnswerAndUpdate(
    //                             extractedData[index]
    //                                 .options
    //                                 .values
    //                                 .toList()[i]),
    //                         child: OptionCard(
    //                           option:
    //                               extractedData[index].options.keys.toList()[i],
    //                           color: isPressed
    //                               ? extractedData[index]
    //                                           .options
    //                                           .values
    //                                           .toList()[i] ==
    //                                       true
    //                                   ? correct
    //                                   : incorrect
    //                               : neutral,
    //                         ),
    //                       ),
    //                   ],
    //                 ),
    //               ),
    //             ]),
    //             floatingActionButton: GestureDetector(
    //               onTap: () => nextQuestion(extractedData.length),
    //               child: const Padding(
    //                 padding: EdgeInsets.symmetric(horizontal: 20),
    //                 child: NextButton(),
    //               ),
    //             ),
    //             floatingActionButtonLocation:
    //                 FloatingActionButtonLocation.centerFloat,
    //           ),
    //         );
    //       }
    //     }

    //     return const Center(
    //       child: CircularProgressIndicator(),
    //     );
    //   },
    // );
  }
}

// class QuizLatihanScreen extends StatelessWidget {
//   const QuizLatihanScreen({super.key});
//   static String routeName = "/quizlatihanscreen";
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(child: Text("QuizLatihanScreen")),
//     );
//   }
// }
