import 'package:education_app_with_firebase/binding/initial_binding.dart';
import 'package:education_app_with_firebase/data_uploader_screen.dart';
import 'package:education_app_with_firebase/route/routes.dart';
import 'package:education_app_with_firebase/screens/splashscreen/splash_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  InitialBinding().dependencies();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'education app with firebase',
      // home: DataUploaderScreen(),
      initialRoute: SplashScreen.routeName,
      getPages: Routes.pages(),
    );
  }
}


