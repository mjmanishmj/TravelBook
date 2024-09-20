import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:mysecondproject/DetailPages/eight.dart';
import 'package:mysecondproject/DetailPages/five.dart';
import 'package:mysecondproject/DetailPages/four.dart';
import 'package:mysecondproject/DetailPages/nine.dart';
import 'package:mysecondproject/DetailPages/one.dart';
import 'package:mysecondproject/DetailPages/seven.dart';
import 'package:mysecondproject/DetailPages/three.dart';
import 'package:mysecondproject/pages/Welcome_PAGE.dart';
import 'package:mysecondproject/widgets/app_large_text.dart';
import 'package:mysecondproject/widgets/app_text.dart';

import '../../DetailPages/ComingSoon.dart';
import '../../DetailPages/six.dart';
import '../../DetailPages/two.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  void OneIndex0() {
    // Function for index 0
    print('Function called for index 0');
    Navigator.push(context, MaterialPageRoute(builder: (context) => One()));
  }
  void TwoIndex1() {
    // Function for index 1
    print('Function called for index 1');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Two()));
  }
  void Threeindex2() {
    // Function for index 2
    print('Function called for index 2');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Three()));
  }
  void FourIndex3() {

    print('Function called for index 3');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Four()));
  }
  void FiveIndex4() {

    print('Function called for index 4');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Five()));
  }
  void SixIndex5() {

    print('Function called for index 5');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Six()));
  }
  void SevenIndex6() {

    print('Function called for index 6');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Seven()));
  }
  void EightIndex7() {

    print('Function called for index 7');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Eight()));
  }
  void NineIndex8() {

    print('Function called for index 8');
    Navigator.push(context, MaterialPageRoute(builder: (context) => Nine()));

  }
  test(){

    print("error");
  }
  //List of Images links
  List<String> ImageId = [];
  //Function to call images from backend
  Future GetImageId ()async{
    await FirebaseFirestore.instance.collection("Appdata").get().then(
            (Snapshot) => Snapshot.docs.forEach((Imageid) {
          print(Imageid.reference);
          ImageId.add(Imageid.reference.id);
        })
    );
  }
  @override
  void initState() {
    GetImageId ();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 3, vsync: this);
    return Scaffold(

        body:  SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //menu text
              Container(
                padding: const EdgeInsets.only(top: 40, left: 20),
                child: Row(
                  children: [
                    IconButton(
                      color: Colors.black54,
                      onPressed: () {
                        print("Back Button is pressed");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => WelcomePage()));
                      },
                      iconSize: 40,
                      icon: const Icon(Icons.arrow_back_ios),
                    ),
                    Expanded(child: Container()),
                    Container(
                      margin: const EdgeInsets.only(right: 20),
                      width: 50,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        image: const DecorationImage(
                            image: AssetImage("img/icon_app.jpg"),
                            fit: BoxFit.cover),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              //discover text
              Container(
                margin: const EdgeInsets.only(left: 20),
                child: AppLargeText(text: "Discover"),
              ),
              const SizedBox(
                height: 35,
              ),
              //tapbar
              Container(
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: TabBar(
                      labelPadding: const EdgeInsets.only(left: 20, right: 20),
                      unselectedLabelColor: Colors.grey,
                      controller: tabController,
                      isScrollable: true,
                      indicator: CircleTabIndicator(
                          color: Colors.deepPurple[300]!.withOpacity(0.7),
                          radius: 4),
                      labelStyle:
                      const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                      tabs: const [
                        Tab(
                          text: "Places",
                        ),
                        Tab(
                          text: "Locations",
                        ),
                        Tab(
                          text: "Cricket",
                        ),
                      ]),
                ),
              ),

              Container(
                padding: const EdgeInsets.only(left: 20),
                height: 300,
                width: double.maxFinite,
                child: TabBarView(
                  controller: tabController,
                  children: [
                    ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 9,
                      itemBuilder: (BuildContext context, int index) {
                        final imageList = [
                          "img/Science-City.jpg",
                          "img/Marine-National-Park.jpg",
                          "img/Statue-of-unity.webp",
                          "img/Somanath_mandir.jpg",
                          "img/rani-ki-va.webp",
                          "img/kankaria-lake.jpg",
                          "img/kamla-zoo.jpg",
                          "img/Dwarkadhish-Temple-Gujarat.jpg",
                          "img/akshardham-temple.jpg",
                          // Add more image paths here if needed
                        ];
                        var imageTexta = [
                          "Science City",
                          "Marine Park",
                          "Statue of unity",
                          "Somanath ",
                          "Rani ki Vav",
                          "Kankaria ",
                          "Kamla Zoo",
                          "Dwarkadhish ",
                          "Akshardham "
                        ];
                        void handleTap(int index) {
                          // Create a list of functions to call based on index
                          List<Function> functions = [
                          OneIndex0,
                            TwoIndex1,
                            Threeindex2,
                            FourIndex3,
                            FiveIndex4,
                            SixIndex5,
                            SevenIndex6,
                            EightIndex7,
                            NineIndex8


                          ];

                          // Check if index is within bounds of the list
                          if (index >= 0 && index < functions.length) {
                            // Call the corresponding function
                            functions[index]();
                          } else {
                            print('No function defined for index $index');
                          }
                        }




                        return Stack( children: [
                          GestureDetector(
                            onTap: () {

                              handleTap(index);
                              },
                            child: Container(
                              margin: const EdgeInsets.only(right: 15, top: 10),
                              width: 200,
                              height: 300,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(imageList[index]),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),

                          Positioned(
                            top: 265,
                            child: ClipRRect(
                              borderRadius:const BorderRadius.only(
                                  bottomLeft:Radius.circular(20),
                                  bottomRight:Radius.circular(20)
                              ),
                              child: Container(
                                width: 200,
                                color:Colors.black12.withOpacity(0.5),
                                child: Center(
                                  child: Text(imageTexta[index],
                                      style:
                                      const TextStyle(color: Colors.white, fontSize: 25)),
                                ),
                              ),
                            ),
                          )
                        ]);
                      },
                    ),
                    const ComingSoon(),
                    const ComingSoon(),
                  ],
                ),
              ),

              const SizedBox(height: 25),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AppLargeText(text: "Explore more", size: 22),
                      InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => ComingSoon()));
                        },
                        child: AppText(
                          text: "See all",
                          color: Colors.deepPurple[300]!.withOpacity(0.7),
                          size: 16,
                        ),
                      )
                    ]),
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                height: 110,
                width: double.maxFinite,
                margin: const EdgeInsets.only(left: 20),
                child: ScrollConfiguration(
                  behavior: ScrollConfiguration.of(context).copyWith(
                    dragDevices: {
                      PointerDeviceKind.touch,
                      PointerDeviceKind.mouse,
                    },
                  ),
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 8,
                      itemBuilder: (_, index) {
                        final imageIcon = [
                          "img/baloonicon.png",
                          "img/trackingicon.png",
                          "img/divingicon.png",
                          "img/kayaicon.png",
                          "img/kayaicon.png",
                          "img/kayaicon.png",
                          "img/kayaicon.png",
                          "img/kayaicon.png",


                          // Add more image paths here if needed
                        ];
                        final iconColor = [
                          Colors.pinkAccent.withOpacity(0.2),
                          Colors.orange.withOpacity(0.22),
                          Colors.lightBlueAccent.withOpacity(0.2),
                          Colors.red.withOpacity(0.22),
                          Colors.red.withOpacity(0.22),
                          Colors.red.withOpacity(0.22),
                          Colors.red.withOpacity(0.22),
                          Colors.red.withOpacity(0.22)

                        ];
                        final iconText = [
                          "Ballooning",
                          "Hiking",
                          "Diving",
                          "Kayaking",
                          "Kayaking",
                          "Kayaking",
                          "Kayaking",
                          "Kayaking",


                        ];
                        return SingleChildScrollView(
                          child: InkWell(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => ComingSoon()));
                            },
                            child: Container(
                              margin: const EdgeInsets.only(right: 25),
                              child: Column(children: [
                                Container(
                                  width: 75,
                                  height: 75,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    color: iconColor[index],
                                    image: DecorationImage(
                                      image: AssetImage(imageIcon[index]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Container(
                                  child: AppText(
                                      text: iconText[index], color: Colors.black38),
                                )
                              ]),
                            ),
                          ),
                        );
                      }),
                ),
              )
            ],


          ),
        )

    );
  }
}

class CircleTabIndicator extends Decoration {
  final Color color;
  double radius;

  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CirclePainter(color: color, radius: radius);
  }
}

class _CirclePainter extends BoxPainter {
  final Color color;
  double radius;

  _CirclePainter({required this.color, required this.radius});

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint paint = Paint();
    paint.color = color;
    paint.isAntiAlias = true;
    final Offset circleOffset =
    Offset(configuration.size!.width / 2 - radius / 2, 39);

    canvas.drawCircle(offset + circleOffset, radius, paint);
  }
}
