import 'package:flutter/material.dart';

import 'package:mysecondproject/widgets/app_buttons.dart';
import 'package:mysecondproject/widgets/app_large_text.dart';
import 'package:mysecondproject/widgets/app_text.dart';
import 'package:mysecondproject/widgets/responsive_button2.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({super.key});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  int gottenStars =3;
  int selectedindex= -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.maxFinite,
        height: double.maxFinite,
        child: Stack(
          children: [
            Positioned(
                left: 0,
                right: 0,
                child: Container(
                    width: double.maxFinite,
                    height: 350,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("img/4img.jpg"),
                            fit: BoxFit.cover)))),
            Positioned(
                left: 20,
                top: 50,
                child: Row(children: [
                  IconButton(
                    color: Colors.white60,
                    onPressed: () {
                      print("Back Button is pressed");

                    },
                    iconSize: 40,
                    icon: const Icon(Icons.arrow_back_ios, color: Colors.white60,)

                ,
                  ),
                  const SizedBox(width: 240),
                  TextButton(
                    onPressed: () {

                    },
                    child: const Text(
                      ":",
                      style: TextStyle(
                        color: Colors.white60,
                        fontSize: 40,
                        fontWeight: FontWeight.w900,
                      ),
                    ),
                  )
                ])),
            Positioned(
                top: 318,
                child: Container(
                  padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40))),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          AppLargeText(text: 'Mountain', color: Colors.black54),
                          AppLargeText(
                            text: '\$250',
                            color: Colors.deepPurple[300]!.withOpacity(1),
                          )
                        ]),
                    const SizedBox(
                      height: 5,
                    ),
                    Row(children: [
                      Icon(Icons.location_on,
                          color: Colors.deepPurple[300]!.withOpacity(1)),
                      const SizedBox(
                        width: 10,
                      ),
                      AppText(
                          text: 'India, Ajmer',
                          color: Colors.deepPurple[200]!.withOpacity(1))
                    ]),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Wrap(
                            children: List.generate(5, (index) {
                              return Icon(Icons.star,color:gottenStars<index?Colors.grey:Colors.yellow[700]);
                            })),
                        const SizedBox(width:10),
                        AppText(text: '(4.0)',color: Colors.deepPurple[300]!.withOpacity(0.9),)
                      ],
                    ),
                        const SizedBox(
                          height: 15,
                        ),
                        AppLargeText(text: "People",color:Colors.black.withOpacity(0.8),size:25),
                        const SizedBox(
  height: 5,
),
                        AppText(text: "Number of people in your group",color:Colors.black26.withOpacity(0.6),size:18,),
                        const SizedBox(
                          height: 10,
                        ),
                        Wrap(
                   children: List.generate(5, (index) {
                     return InkWell(
                       onTap: (){
                        setState(() {
                          selectedindex = index;

                        });
                       },
                       child: Container(
                         margin: const EdgeInsets.only(right: 10,
                         ),
                         child: AppButtons(size: 54,
                             color:  selectedindex == index?Colors.white:Colors.black,
                             backgroundColor: selectedindex == index?Colors.black.withOpacity(0.7):Colors.deepPurple[400]!.withOpacity(0.2),
                             borderColor: selectedindex == index?Colors.black.withOpacity(0.7):Colors.deepPurple[400]!.withOpacity(0.2),
                           text: (index+1).toString()
                         ),
                       ),
                     );

                   }),
                 ),
                        const SizedBox(
                          height:10
                        ),
                        AppLargeText(text: "Description",color: Colors.black.withOpacity(0.7),size: 25,),
                        AppText(text: "Climb the mountain not to plant your flag, but to embrace the challenge, enjoy the air, behold the view. Climb to see, not to be seen.",color: Colors.black26.withOpacity(0.6),),
                        const SizedBox(height: 5,),

                      ]
                  ),
                )),
            Positioned(
                bottom: 15,
                left: 20,
                right: 20,
                child: Row(
                  children: [
                    AppButtons(
                        size: 65,
                        color:Colors.deepPurple[300]!.withOpacity(1) ,
                        backgroundColor: Colors.white,
                        borderColor: Colors.deepPurple[300]!.withOpacity(1),
                      isIcon: true,
                      icon: Icons.favorite_border,


                    ),
                    const SizedBox(width: 15,),
                    ResponsiveButton2(
                      isResponsive: true,

                    )
                  ],


            ))
          ],
        ),
      ),
    );
  }
}
