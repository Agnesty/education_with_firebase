import 'package:education_app_with_firebase/controller/materi_ctr.dart';
import 'package:education_app_with_firebase/controller/pembahasan_ctr.dart';
import 'package:education_app_with_firebase/controller/quizLat_ctr.dart';
import 'package:education_app_with_firebase/screens/home/home_menu_screen.dart';
import 'package:education_app_with_firebase/screens/onboardingscreen/onboarding_screen.dart';
import 'package:education_app_with_firebase/screens/pembahasan/components/video_widget.dart';
import 'package:education_app_with_firebase/screens/pembahasan/pembahasan2_screen.dart';
import 'package:education_app_with_firebase/screens/pembahasan/pembahasan3_screen.dart';
import 'package:education_app_with_firebase/screens/pembahasan/videopreferrence/video_preference.dart';
import 'package:education_app_with_firebase/screens/quiz/quizLatihan/quiz_latihan_screen.dart';
import 'package:education_app_with_firebase/screens/splashscreen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> pages() => [
        GetPage(name: "/splashscreen", page: () => const SplashScreen()),
        GetPage(name: "/onboarding", page: () => const OnBoardingScreen()),
        GetPage(
            name: "/home",
            page: () => const HomeScreen(),
            binding: BindingsBuilder(() {
              Get.put(PembahasanCtr());
            })),
        GetPage(
            name: "/pembahasan2",
            page: () => Pembahasan2Screen(),
            binding: BindingsBuilder(
              () {
                Get.put(MateriCtr());
              },
            )),
        GetPage(
          name: "/pembahasan3",
          page: () => const Pembahasan3Screen(),
        ),
        // GetPage(
        //   name: "/videolandscapepreference",
        //   page: () => const VideoLandscapePreference(),
        //   // binding: BindingsBuilder(
        //   //   () {
        //   //     Get.put(VideoCtr());
        //   //   },
        //   // )
        // ),
        GetPage(
          name: "/quizlatihanscreen",
          page: () => const QuizLatihanScreen(),
          binding: BindingsBuilder(
            () {
              Get.put(QuizLatCtr());
            },
          )
        ),
      ];
}
