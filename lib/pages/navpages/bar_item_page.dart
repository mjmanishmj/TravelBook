import 'dart:ui';

import 'package:flutter/material.dart';


class BarItemPage extends StatelessWidget {
  final List<String> imageList = [
    "img/11img.jpg",
    "img/12img.jpeg",
    "img/6img.jpg",
    // Add more image paths here if needed
  ];

  final List<String> imageTexta = [
    "GUJARAT",
    "RAJASTHAN",
    "COMING SOON",
  ];

   BarItemPage({Key? key}) : super(key: key);

  void test() {
    print("It's working");
  }

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(

      appBar: AppBar(


        backgroundColor: Colors.deepPurple[300],
        title: const Text('SELECT STATES',style: TextStyle(
          color: Colors.white70,
          fontSize: 30,
          fontFamily: 'San Francisco'

        ),),
      ),
      body:  ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {
            PointerDeviceKind.touch,
            PointerDeviceKind.mouse,
          },
        ),
        child: Center(
          child: Container(
            child: ListView.builder(
              scrollDirection: Axis.vertical,
              itemCount: 3,
              itemBuilder: (context, index) {
                return Stack(
                  children: [
                    GestureDetector(
                      onTap: () {
                        test();

                      },
                      child: Container(
                        margin: const EdgeInsets.only(left: 25, right: 25, top: 20),
                        width: double.maxFinite,
                        height: 250,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.black26,
                          image: DecorationImage(
                            image: AssetImage(imageList[index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 220,
                      left: 25,
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          topLeft: Radius.circular(150),
                          bottomRight: Radius.circular(200),
                          topRight: Radius.circular(30),
                        ),
                        child: Container(


                          width: 300,
                          color: Colors.white70.withOpacity(0.5),
                          child: Center(

                            child: Text(
                              imageTexta[index],
                              style: TextStyle(color: Colors.black26.withOpacity(0.7), fontSize: 35),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    ),);
  }
}
