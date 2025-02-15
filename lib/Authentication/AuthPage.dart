import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mysecondproject/Authentication/Pages/Login_page.dart';

import 'Pages/Register_page.dart';
class AuthPage extends StatefulWidget {
  const AuthPage({super.key});

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  bool showLoginPage = true;
  void toggleScreens(){
setState(() {
  showLoginPage = !showLoginPage;
});
  }

  @override
  Widget build(BuildContext context) {
 if(showLoginPage){
   return LoginPage(showRegisterPage: toggleScreens);
 }else
   {
     return RegistePage(showLoginPage:toggleScreens );
   }
  }
}
