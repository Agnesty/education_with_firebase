// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final Function? press;
  final String? text;
 const DefaultButton({
    Key? key,
    this.text,
    this.press,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: TextButton(
        onPressed: press as void Function()?,
        style: TextButton.styleFrom(shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            foregroundColor: Colors.white,
            backgroundColor: Color(0xFFFF7643),),
        child: Text(text!, style: const TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),),
      ),
    );
  }
}
