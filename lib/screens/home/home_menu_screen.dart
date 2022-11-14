import 'package:education_app_with_firebase/screens/latihan/latihan_screen.dart';
import 'package:education_app_with_firebase/screens/pembahasan/pembahasan_screen.dart';
import 'package:education_app_with_firebase/screens/profile/profile_screen.dart';
import 'package:education_app_with_firebase/screens/ujian/ujian_screen.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static String routeName = "/home";
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List pages = [
    PembahasanScreen(),
    LatihanScreen(),
    UjianScreen(),
    ProfileScreen(),
  ];

  int currentIndex = 0;
  void onTap(int index) {
    setState(() {
      currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.white,
          onTap: onTap,
          currentIndex: currentIndex,
          showSelectedLabels: false,
          showUnselectedLabels: false,
          items: [
            BottomNavigationBarItem(
                label: 'Pembahasan',
                icon: Image.asset(
                  'assets/IconMenuBottom/level.png',
                  height: 30,
                ),
                activeIcon: Image.asset('assets/IconMenuBottom/level2.png',
                    height: 30)),
            BottomNavigationBarItem(
                label: 'Latihan',
                icon: Image.asset('assets/IconMenuBottom/book.png', height: 30),
                activeIcon:
                    Image.asset('assets/IconMenuBottom/book2.png', height: 30)),
            BottomNavigationBarItem(
                label: 'Ujian',
                icon:
                    Image.asset('assets/IconMenuBottom/market.png', height: 30),
                activeIcon: Image.asset('assets/IconMenuBottom/market2.png',
                    height: 30)),
            BottomNavigationBarItem(
                label: 'Profile',
                icon:
                    Image.asset('assets/IconMenuBottom/person.png', height: 30),
                activeIcon: Image.asset('assets/IconMenuBottom/person2.png',
                    height: 30)),
          ]),
    );
  }
}
