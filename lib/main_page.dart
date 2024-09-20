import 'package:flutter/material.dart';
import 'package:mysecondproject/DetailPages/ComingSoon.dart';
import 'package:mysecondproject/pages/navpages/bar_item_page.dart';
import 'package:mysecondproject/pages/navpages/my_page.dart';
import 'package:mysecondproject/pages/navpages/search_page.dart';

import 'pages/navpages/home_page.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  List pages = [
    const HomePage(),
    BarItemPage(),
    ComingSoon(),
   // const SearchPage(),
    const MyPage(),
  ];
  int currentIndex = 0;
  void onTap(int index){
    setState((){
currentIndex = index;
    });
  }
  @override
  Widget build(BuildContext context) {
    var apps;
    return Scaffold(
      backgroundColor:Colors.white,
      body: pages[currentIndex],
bottomNavigationBar:BottomNavigationBar(
    selectedFontSize:0,
  unselectedFontSize:0,
  type: BottomNavigationBarType.fixed,
  backgroundColor:Colors.white,
  onTap: onTap,
  currentIndex: currentIndex,
  selectedItemColor: Colors.black54,
  unselectedItemColor: Colors.grey.withOpacity(0.5),
  showUnselectedLabels:false,
  showSelectedLabels:false,
  elevation:0,
  items: const [
    BottomNavigationBarItem(
        label:"home"
        ,icon: Icon(Icons.apps,size: 32,)),
    BottomNavigationBarItem(
        label:"Bar"
        ,icon: Icon(Icons.bar_chart_sharp,size: 32,)),
    BottomNavigationBarItem(
        label:"Search"
        ,icon: Icon(Icons.message,size: 32,)),
    BottomNavigationBarItem(
        label:"My"
        ,icon: Icon(Icons.person,size: 32,)),
  ]
),
    );
  }
}
