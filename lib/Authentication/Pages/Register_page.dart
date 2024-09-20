
import 'dart:async';
import 'dart:io';
import 'dart:ui';


import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RegistePage extends StatefulWidget {



  final VoidCallback showLoginPage;
  const RegistePage({super.key,required this.showLoginPage});

  @override
  State<RegistePage> createState() => _RegistePageState();
}

class _RegistePageState extends State<RegistePage> {

  void showErrorSnackBar(BuildContext context, String errorMessage) {
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
  void showEmailErrorSnackBar(BuildContext context, String errorMessage) {
    final snackBar = SnackBar(
      content: Text(
        errorMessage,
        style: const TextStyle(color: Colors.white),
      ),
      backgroundColor: Colors.red, // Background color for error
      duration: const Duration(seconds: 3), // Display duration
      behavior: SnackBarBehavior.floating, // SnackBar pops up from the top
      margin: const EdgeInsets.only(top: 10), // Distance from the top
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
  void SignInSucsess(BuildContext context, String SucessMessage) {
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
  // Email Checke for os ot empty
  bool CheckEmailEmpty(String email){
    if (email.isEmpty){
      return true;
    }
    else{
      return false;
    }
  }
  // Email validator to check the email syntax
  bool isEmailValid(String email) {
    String emailRegex =
        r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$'; // Regular expression for email validation
    RegExp regex = RegExp(emailRegex);
    return regex.hasMatch(email);
  }

  bool passwordVisible=false;
  late IconData appIcon;

  //text controllers
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _ConfirmPasswordController = TextEditingController();
  final _AdressController = TextEditingController();
  final _FirstNameController = TextEditingController();
  final _LastNameController = TextEditingController();

  // Database request makers
 Future SignUp () async {
   if (CheckEmailEmpty(_emailController.text.trim())) {
     showEmailErrorSnackBar(context,"Email field is Empty");
   }
   else {
     if (isEmailValid(_emailController.text.trim())) {
       if (SamePass()) {
         SignInSucsess(context, "Signing Up Now...");
         // Creating our User
         await FirebaseAuth.instance.createUserWithEmailAndPassword(
             email: _emailController.text.trim(),
             password: _passwordController.text.trim()
         );
         addUserDetails(_FirstNameController.text.trim(), _LastNameController.text.trim(), _AdressController.text.trim(), _emailController.text.trim());
       } else {
         showErrorSnackBar(context, "Password not mached!");
       }
     } else {
       showEmailErrorSnackBar(context, "Wrong Email ");
     }
   }
 }
  // Add User Details function
 Future addUserDetails (String FirstName,String LastName , String Address, String Email)async{
   await FirebaseFirestore.instance.collection("user").add({
     'FirstName':FirstName,
     'LastName':LastName,
     'Address':Address,
     'Email':Email

   });
 }
 // To check is the paswords are same or not
 bool SamePass(){
   if(_passwordController.text.trim() == _ConfirmPasswordController.text.trim()){
     return true;
   }else{
     return false;
   }
 }
  @override
  void dispose() {
    _passwordController.dispose();
    _emailController.dispose();
    _ConfirmPasswordController.dispose();
    _FirstNameController.dispose();
    _LastNameController.dispose();
    _AdressController.dispose();
    super.dispose();
  }
  @override
  void initState(){
    super.initState();
    passwordVisible=true;
    setAppIcon();
  }
  // To Check Set App icon and width on based the device
  void setAppIcon() {
    if(kIsWeb){
      appIcon = Icons.laptop;
      WidthVar = 600.0;
    }else{
      if (Platform.isAndroid) {

        appIcon = Icons.android_outlined;
        WidthVar = double.maxFinite;
      } else if (Platform.isIOS) {
        appIcon = Icons.apple_outlined;
        WidthVar = double.maxFinite;
      } else if (Platform.isWindows) {
        appIcon = Icons.monitor_outlined;
        WidthVar = 600.0;
      } else if (Platform.isMacOS) {
        appIcon = Icons.apple_outlined;
        WidthVar = 600.0;
      } else {
        appIcon = Icons.android_outlined;
        WidthVar = double.maxFinite;// Default icon if neither Android nor iOS
      }
    }
  }
  late double WidthVar;
  final List<Tab> tabs = <Tab>[
    Tab(icon: Icon(Icons.arrow_back_ios)),
    Tab(text: 'Next  >>',),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        body: DefaultTabController(
          length: tabs.length,
          child: Scaffold(

            body: TabBarView(
              children: [
                //Tab Bar  1
                Container(
                  color: Colors.grey[300],
                    height: double.maxFinite,
                    width: double.maxFinite,

                    child: ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height:100 ,),
                            Icon(appIcon,size: 110,color: Colors.deepPurple[300],),

                            Text(
                                "Hello There",
                                style: GoogleFonts.bebasNeue(
                                    fontSize:52
                                )
                            ),

                            const Text(
                              "Register below with your details",
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
                                    controller: _ConfirmPasswordController ,
                                    style:const TextStyle(fontSize:22),
                                    obscureText:passwordVisible,
                                    decoration: InputDecoration(

                                      hintText: 'Confirm Password',
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
                            const SizedBox(height: 15,),
                            //sign in button

                            const SizedBox(height: 25,),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const Text("I am a member ",style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20
                                )),
                                GestureDetector(

                                  onTap: widget.showLoginPage ,
                                  child: Text(" Login Now",style: TextStyle(
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
                    ),),
                // Tab Bar 2
                Container(
                    color: Colors.grey[300],
                    height: double.maxFinite,
                    width: double.maxFinite,

                    child:ScrollConfiguration(
                      behavior: ScrollConfiguration.of(context).copyWith(
                        dragDevices: {
                          PointerDeviceKind.touch,
                          PointerDeviceKind.mouse,
                        },
                      ),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(height:100 ,),
                            Icon(appIcon,size: 110,color: Colors.deepPurple[300],),

                            Text(
                                "USER DETAILS",
                                style: GoogleFonts.bebasNeue(
                                    fontSize:52
                                )
                            ),

                            const Text(
                              "Please fill your details below",
                              style: TextStyle(

                                fontSize: 20,

                              ),
                            ),
                            const SizedBox(height: 35),

                            //FIrst Name
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
                                    controller: _FirstNameController,
                                    style:const TextStyle(fontSize:22),
                                    decoration: const InputDecoration(

                                      hintText: 'First Name ',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 20),
                                    ),

                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15,),
                            //Last name
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
                                    controller: _LastNameController,
                                    style:const TextStyle(fontSize:22),
                                    decoration: const InputDecoration(

                                      hintText: 'Last Name',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 20),
                                    ),

                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15,),
                            //Adresss
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
                                    controller: _AdressController,
                                    style:const TextStyle(fontSize:22),
                                    decoration: const InputDecoration(

                                      hintText: 'Address',
                                      border: InputBorder.none,
                                      hintStyle: TextStyle(fontSize: 20),
                                    ),

                                    textInputAction: TextInputAction.next,
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: 15,),

                            //sign in button
                            Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                                child: Ink(
                                  decoration: BoxDecoration(
                                    color: Colors.deepPurple[300],
                                    borderRadius: BorderRadius.all(Radius.circular(12)),
                                  ),
                                  child: InkWell(
                                    onTap: SignUp,
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.deepPurple[300],
                                        borderRadius: BorderRadius.all(Radius.circular(12)),
                                      ),
                                      width: WidthVar,

                                      padding: const EdgeInsets.all(15),
                                      child: const Center(
                                        child: Text(
                                          "Sign Up",
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









                            // Additional widgets can be added here
                          ],
                        ),
                      ),
                    ), ),

              ],
            ),
            // Placing the TabBar at the bottom of the Scaffold
            bottomNavigationBar: Container(

              color: Colors.grey[300],
              child: TabBar(
                tabs: tabs,

                labelColor: Colors.grey[300],
                unselectedLabelStyle:

                TextStyle(
                  fontSize: 20
                ),
                unselectedLabelColor:Colors.deepPurple[300],
                indicatorColor: Colors.grey[300],
                indicator: BoxDecoration(
                 borderRadius: BorderRadius.circular(12.0),
                  color: Colors.grey[300]),
                indicatorSize: TabBarIndicatorSize.tab,
    )
        ) )
        )
          );



  }
}
