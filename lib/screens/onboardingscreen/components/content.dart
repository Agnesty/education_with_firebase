import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Content extends StatelessWidget {
    String? text, image;
   Content({
    Key? key, 
    required this.text, 
    required this.image}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
        children: <Widget>[
          const Text("AGNESTY EDU", style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),),
          Spacer(flex: 1,),
          Text(text!,
          maxLines: 2,
          textAlign: TextAlign.center,),
          LottieBuilder.network(
            image!,
            height: 250,
            width: 250,
            )
        ],
      
    );
  }
}