import 'dart:ui';

import 'package:flutter/material.dart';

import 'package:mysecondproject/widgets/app_large_text.dart';
import 'package:mysecondproject/widgets/app_text.dart';
import 'package:mysecondproject/widgets/responsive_button.dart';

import '../Authentication/AuthPage.dart';
import '../Authentication/main_page.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  myprint(){
    print("working");
  }
  List images = [
    "1img.jpg",
    "2img.jpg",
    "3img.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
body:
        ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
      dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },
    ),
    child: PageView.builder(
    scrollDirection: Axis.vertical,
    itemCount:images.length,
    itemBuilder: (_, index){
return Container(
  width:double.maxFinite,
  height: double.maxFinite,
  decoration: BoxDecoration(
image: DecorationImage(
  image: AssetImage(
"img/"+images[index]
  ),
  fit:BoxFit.cover,
)
  ),
  child: Container(
    margin: const EdgeInsets.only(top:150, left:20 ,right:20),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AppLargeText(text: "Trips"),
            AppText(text: "Mountain",size:30,),
            const SizedBox(height: 20,),
            SizedBox(
              width:250,
              child: AppText(
                text: "Mountain hikes gives an incredible sense of freedom along with endurance test",
             size: 14,
              ),
            ),
            const SizedBox(height: 40,),
            InkWell(
              onTap: (){

                myprint();
                Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => mainPage()), // Navigate to AuthPage
                );
              },

              child: SizedBox(
                  width: 225,
                  child: ResponsiveButton()),
            )

          ],
        ),
        Column(
children: List.generate(3, (indexDots){
  return Container(
    margin: const EdgeInsets.only(bottom: 8),
    width: 8,
    height: index==indexDots?35:10,
    decoration: BoxDecoration(
borderRadius: BorderRadius.circular(8),
      color:index==indexDots?Colors.deepPurple[400]?.withOpacity(0.8):Colors.deepPurple[100]?.withOpacity(0.7)
    ),
  );
})
        )
      ]
    ),
  ),
);
}
),
    ));
  }
}
