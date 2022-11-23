import 'package:education_app_with_firebase/screens/home/home_menu_screen.dart';
import 'package:education_app_with_firebase/screens/onboardingscreen/components/content.dart';
import 'package:education_app_with_firebase/screens/onboardingscreen/components/default_button.dart';
import 'package:flutter/material.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});
  static String routeName = "/onboardingscreen";
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  int currentPage = 0;
  List<Map<String, String>> ContentData = [
    {
      "text": "This is my portfolio to \nmake education app with flutter",
      "image": "https://assets3.lottiefiles.com/packages/lf20_h7ofe9pc.json"
    },
    {
      "text": "This edu app is all about \neducation in High School",
      "image": "https://assets3.lottiefiles.com/packages/lf20_h7ofe9pc.json"
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: <Widget>[
              const Spacer(flex: 1),
              Expanded(
                flex: 3,
                child: PageView.builder(
                    onPageChanged: (value) {
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: ContentData.length,
                    itemBuilder: (context, index) => Content(
                          image: ContentData[index]["image"],
                          text: ContentData[index]["text"],
                        )),
              ),
              Expanded(
                  flex: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(ContentData.length,
                              (index) => buildDot(index: index)),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        DefaultButton(
                          text: "Continue",
                          press: () {
                            Navigator.pushNamed(context, HomeScreen.routeName);
                          },
                        ),
                        const Spacer(),
                      ],
                    ),
                  )),
                  
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer buildDot({int? index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      margin: EdgeInsets.only(right: 5),
      width: currentPage == index ? 20 : 6,
      height: 6,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: currentPage == index ? Color(0xFFFF7643) : Color(0xFFD8D8D8),
      ),
    );
  }
}
