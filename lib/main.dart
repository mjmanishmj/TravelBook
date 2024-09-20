

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:mysecondproject/Authentication/main_page.dart';
import 'package:mysecondproject/DetailPages/ComingSoon.dart';
import 'package:mysecondproject/DetailPages/eight.dart';
import 'package:mysecondproject/DetailPages/six.dart';
import 'package:mysecondproject/pages/Welcome_PAGE.dart';
import 'package:mysecondproject/pages/navpages/home_page.dart';
import 'package:mysecondproject/pages/navpages/my_page.dart';











import 'DetailPages/nine.dart';
import 'firebase_options.dart';
import 'main_page.dart';
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, Key? man});

  get create => null;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Travelling APP Project',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
          useMaterial3: true,
        ),
        home:
        const
           // Six()
         // Eight()
        //Nine()
     // ComingSoon()
      //HomePage()
      //MainPage()
           // MyPage()
      //mainPage()

      //BarItemPage()
      //MainPage(),

      WelcomePage(),
      //DetailPage(),
      //WelcomePage2()
       );

  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, Key? man, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),


    );
  }
}
