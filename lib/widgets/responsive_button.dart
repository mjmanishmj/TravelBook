import 'package:flutter/material.dart';

class ResponsiveButton extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton({super.key ,this.width = 225,this.isResponsive=false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Container(
          width: width,
          height: 55,
          decoration: BoxDecoration(
            borderRadius:BorderRadius.circular(10),
            color: Colors.white70.withOpacity(0.6)
          ),
          child:
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset("img/arrow.png"),

              ],

          ),
        ),
      ),
    );
  }
}
