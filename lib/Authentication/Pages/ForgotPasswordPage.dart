import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'dart:io';


class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  double WidthVar = 0;

  @override
  void initState() {
    super.initState();
    WidthFun();
  }

  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  // Password reset method
Future PasswordReset()async{
  try {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: _emailController.text.trim());
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Password reset email sent.'),
        duration: Duration(seconds: 3),
        backgroundColor: Colors.green,// Adjust as needed
      ),
    );
  } on FirebaseAuthException catch (e) {
    print(e);
  }

}


  void WidthFun() {
    if (kIsWeb) {
      WidthVar = 600.0;
    } else {
      if (Platform.isAndroid) {
        WidthVar = double.maxFinite;
      } else if (Platform.isIOS) {
        WidthVar = double.maxFinite;
      } else if (Platform.isWindows) {
        WidthVar = 600.0;
      } else if (Platform.isMacOS) {
        WidthVar = 600.0;
      } else {
        WidthVar = double.maxFinite;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: const Text(
              "Enter Your Email and we will send you a password reset link",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 24),
            ),
          ),
          SizedBox(height: 15),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Container(
              width: WidthVar,
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: TextFormField(
                  controller: _emailController,
                  style: const TextStyle(fontSize: 22),
                  decoration: const InputDecoration(
                    hintText: 'Email',
                    border: InputBorder.none,
                    hintStyle: TextStyle(fontSize: 20),
                  ),
                  textInputAction: TextInputAction.done,
                ),
              ),
            ),
          ),
          SizedBox(height: 20),
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Ink(
                decoration: BoxDecoration(
                  color: Colors.deepPurple[300],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: InkWell(

                  onTap: PasswordReset,
                  child: Container(
                    width: WidthVar,
                    padding: const EdgeInsets.all(15),
                    child: Center(
                      child: Text(
                        "Reset Password",
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

        ],
      ),
    );
  }
}
