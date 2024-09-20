import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysecondproject/widgets/app_text.dart';

class AppButtons extends StatelessWidget {
  final Color color;
  String? text ;
  IconData? icon ;
  final Color backgroundColor;
  double size;
  final Color borderColor;
  bool isIcon;


   AppButtons({super.key,
     this.isIcon = false,
     this.text = "1",
     this.icon,
   required this.size,
    required this.color,
    required this.backgroundColor,
    required this.borderColor});

  @override
  Widget build(BuildContext context) {
    return Container(

      width:size,
      height: size,
      decoration: BoxDecoration(
        border: Border.all(
          color:borderColor ,
          width: 2
        ),
        borderRadius: BorderRadius.circular(18),
        color:backgroundColor,
      ),
        child: isIcon == false?Center(child: AppText(text: text!,color: color,size: 22,)):Center(child: Icon(icon, color: color,))
    );
  }
}
