import 'package:flutter/material.dart';
import 'package:mysecondproject/widgets/app_text.dart';

class ResponsiveButton2 extends StatelessWidget {
  bool? isResponsive;
  double? width;
  ResponsiveButton2({super.key ,this.width = 266,this.isResponsive=false});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Center(
        child: Container(
          width: width,
          height: 65,
          decoration: BoxDecoration(
              borderRadius:BorderRadius.circular(10),
              color: Colors.deepPurple[400]?.withOpacity(0.7)
          ),
          child:
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AppText(text: "Book Trip Now",color: Colors.white,size: 20,),
              Image.asset("img/arrow.png",width: 50,),

            ],

          ),
        ),
      ),
    );
  }
}
