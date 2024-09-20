import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysecondproject/main_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mysecondproject/widgets/app_buttons.dart';
import 'package:mysecondproject/widgets/app_large_text.dart';
import 'package:mysecondproject/widgets/app_text.dart';
import 'package:mysecondproject/widgets/responsive_button2.dart';

class Three extends StatefulWidget {
  const Three({super.key});

  @override
  State<Three> createState() =>_ThreeState();
}

class _ThreeState extends State<Three> {
//get mail => user;
  //final user = FirebaseAuth.instance.currentUser;

  // Add User Details function
  Future<void> addUserDetails(String place,int peoples) async {
    // Get the current user
    var user = FirebaseAuth.instance.currentUser;
    peoples = peoples + 1;
    if(peoples != 0){
      // Make sure the user is not null
      if (user != null) {
        // Get the user's email
        String? userEmail = user.email;
        var currentTime = FieldValue.serverTimestamp();

        // Add the details to Firestore
        await FirebaseFirestore.instance.collection("Booking_Requests").add({
          'PlaceName': place,
          'Peoples':peoples,
          'CustomerEmail': userEmail,
          'BokingTime':currentTime
        }
        );
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 5),
            content: SizedBox(
              height: 60, // Set the desired height
              child: Center(
                child: Text('${place} Booking successful', textAlign: TextAlign.center),
              ),
            ),
            backgroundColor: Colors.green,
          ),
        );

      } else {
        // Handle case where user is not signed in
        print("User is not signed in.");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            duration: Duration(seconds: 2),
            content: SizedBox(
              height: 60, // Set the desired height
              child: Center(
                child: Text('Error User Not Found ', textAlign: TextAlign.center),
              ),
            ),
            backgroundColor: Colors.red,
          ),
        );
      }}else{
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          duration: Duration(seconds: 2),
          content: SizedBox(
            height: 60, // Set the desired height
            child: Center(
              child: Text('Please Select Number of People', textAlign: TextAlign.center),
            ),
          ),
          backgroundColor: Colors.deepOrangeAccent,
        ),
      );

    }
  }
  String Discription =
      "Statue of Unity: World's tallest statue, honoring Sardar Vallabhbhai Patel, situated in Gujarat, India.";
  String Location = 'Gujrat,Narmada';
  String PlaceName ="Statue of Unity";
  int gottenStars =4;
  int selectedindex= -1;
  String ImageData ="img/Statue-of-unity.webp";
  String price = '\u{20B9}600';

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
                    decoration:  BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImageData),
                            fit: BoxFit.cover)))),
            Positioned(
                left: 20,
                top: 50,
                child: Row(children: [
                  IconButton(
                    color: Colors.white60,
                    onPressed: () {
                      print("Back Button is pressed");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => MainPage()));

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
                              AppLargeText(text: PlaceName, color: Colors.black54),
                              AppLargeText(
                                text: price,
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
                              text: Location,
                              color: Colors.deepPurple[200]!.withOpacity(1))
                        ]),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            Wrap(
                                children: List.generate(5, (index) {
                                  return Icon(Icons.star,color:gottenStars<index?Colors.grey:Colors.yellow[700]);
                                })),
                            const SizedBox(width:10),
                            AppText(text: '(5.0)',color: Colors.deepPurple[300]!.withOpacity(0.9),)
                          ],
                        ),
                        const SizedBox(
                          height: 1,
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
                        SingleChildScrollView(child: AppText(text: Discription,color: Colors.black26.withOpacity(0.6),)),
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
                    InkWell(
                      onTap:  (){
                        addUserDetails(PlaceName,selectedindex);
                        print("Button is pressed");
                      },
                      child: ResponsiveButton2(
                        isResponsive: true,

                      ),
                    )
                  ],


                ))
          ],
        ),
      ),
    );
  }
}
