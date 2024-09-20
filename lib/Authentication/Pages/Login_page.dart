import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'dart:io' show Platform;
import 'dart:io';

import 'ForgotPasswordPage.dart';


class LoginPage extends StatefulWidget {
  final VoidCallback showRegisterPage;
  const LoginPage({Key? key, required this.showRegisterPage}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
 // late double padd;
  void showEmailErrorSnackBar(BuildContext context, String errorMessage) {
    final snackBar = SnackBar(
      content: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red, // Background color for error
      duration: const Duration(seconds: 2), // Display duration
      behavior: SnackBarBehavior.floating, // SnackBar pops up from the top
      margin: const EdgeInsets.only(top: 10), // Distance from the top
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void SignUpSucsess(BuildContext context, String SucessMessage) {
    final snackBar = SnackBar(
      content: Text(
        SucessMessage,
        style: const TextStyle(color: Colors.white),
      ),

      backgroundColor: Colors.green[300],
      duration: const Duration(seconds: 2), // Display duration
      behavior: SnackBarBehavior.floating, // SnackBar pops up from the top
      margin: const EdgeInsets.only(top: 10),

    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  bool passwordVisible=false;
  late IconData appIcon;
  // Login Checking For email
  bool isEmailValid(String email) {
    String emailRegex =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Regular expression for email validation
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }
  bool CheckEmailEmpty(String email){
    if (email.isEmpty){
      return true;
    }
    else{
     return false;
    }
  }

//text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();


  Future SignIn () async{

    if(CheckEmailEmpty(_emailController.text.trim())){
      showEmailErrorSnackBar(context,"Email field is Empty!");
  }else{
      if(isEmailValid(_emailController.text.trim())){
        SignUpSucsess(context,"Signing Up Now...");
      print(_emailController);
      print(_passwordController);
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email : _emailController.text.trim(),
        password:_passwordController.text.trim(),);
      }else{
        showEmailErrorSnackBar(context,"Wrong Email Id! ");
      }
    }
  }
@override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    super.dispose();
  }
  @override
  void initState(){
    super.initState();
    passwordVisible=true;

    setAppIcon();
  }
  late double WidthVar;
  void setAppIcon() {
   if(kIsWeb){
     appIcon = Icons.laptop;
     WidthVar = 600.0;
   }else{
     if (Platform.isAndroid) {
       appIcon = Icons.android_outlined;
       WidthVar = double.maxFinite;
   //  Padd = 25.0;
     } else if (Platform.isIOS) {
     //  padd = 25.0;
       appIcon = Icons.apple_outlined;
       WidthVar = double.maxFinite;
     } else if (Platform.isWindows) {
       appIcon = Icons.monitor_outlined;
       WidthVar = 600.0;
      // Padd = 330.0;
     } else if (Platform.isMacOS) {
       appIcon = Icons.apple_outlined;
       WidthVar = 600.0;
     } else {
       appIcon = Icons.android_outlined;
       WidthVar = double.maxFinite;// Default icon if neither Android nor iOS
     }
   }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: Center(
          child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
      dragDevices: {
        PointerDeviceKind.touch,
        PointerDeviceKind.mouse,
      },
    ),
            child: SingleChildScrollView(
              child: Container(
                width: WidthVar,

                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(appIcon,size: 110,color: Colors.deepPurple[300],),

                    Text(
                      "Hello Again",
                      style: GoogleFonts.bebasNeue(
                        fontSize:52
                      )
                    ),

                    const Text(
                      "Welcome Back, you've been missed!",
                      style: TextStyle(

                        fontSize: 20,

                      ),
                    ),
                    const SizedBox(height: 35),
                    // Email text field
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        width: WidthVar,
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          border: Border.all(color: Colors.white),
                          borderRadius: BorderRadius.circular(12.0)
                        ),

                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            controller: _emailController,
                            style:const TextStyle(fontSize:22),
                            decoration: const InputDecoration(

                              hintText: 'Email',
                              border: InputBorder.none,
                              hintStyle: TextStyle(fontSize: 20),
                            ),

                            textInputAction: TextInputAction.next,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25.0),
                      child: Container(
                        width: WidthVar,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            border: Border.all(color: Colors.white),
                            borderRadius: BorderRadius.circular(12.0)
                        ),

                        child: Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: TextFormField(
                            controller: _passwordController,
                            style:const TextStyle(fontSize:22),
                            obscureText:passwordVisible,
                            decoration: InputDecoration(

                              hintText: 'Password',
                              border: InputBorder.none,
                              hintStyle: const TextStyle(fontSize: 20),
                              suffixIcon: IconButton(
                                icon: Icon(passwordVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off),
                                onPressed: () {
                                  setState(
                                        () {
                                      passwordVisible = !passwordVisible;
                                    },
                                  );
                                },
                              ),


                            ),
                            keyboardType: TextInputType.visiblePassword,
                            textInputAction: TextInputAction.done,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 25.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () {
                             Navigator.push(context, MaterialPageRoute(builder:(context) {
                               return ForgotPassword();
                             }));
                            },
                            child: Text("Forgot Password?",style: TextStyle(
                                color: Colors.deepPurple[300],
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 15,),
                        //sign in button
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 25.0),
                      child: Ink(
                        decoration: BoxDecoration(
                          color: Colors.deepPurple[300],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: InkWell(

                          onTap: SignIn,
                          child: Container(
                            width: WidthVar,
                            padding: const EdgeInsets.all(15),
                            child: Center(
                              child: Text(
                                "Sign In",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 25,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )

                    ),
                    const SizedBox(height: 25,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                                  const Text("Not a member? ",style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                  )),
                                  GestureDetector(
                                    onTap: widget.showRegisterPage ,
                                    child: Text(" Register Now",style: TextStyle(
                                      color: Colors.deepPurple[300],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20
                                    ),),
                                  )
                                ],
                              )







                        // Additional widgets can be added here
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );

  }
}
