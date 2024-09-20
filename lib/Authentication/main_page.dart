import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../main_page.dart';
import '../pages/Welcome_PAGE.dart';
import 'AuthPage.dart';
class mainPage extends StatelessWidget {
  const mainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
      dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },
    ),
        child: StreamBuilder<User?>(stream: FirebaseAuth.instance.authStateChanges(),
          builder: ( context,snapshot) {
          if(snapshot.hasData){
            return const MainPage();
          }else{
            return const
           // WelcomePage();
             AuthPage();
          }
          },),
      ),
    );
  }
}
