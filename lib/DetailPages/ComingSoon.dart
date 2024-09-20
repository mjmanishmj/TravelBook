import 'package:flutter/material.dart';
class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple[300],
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.white,
          size: 30,
        ),
      ),
      body: Center(
        child: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          color: Colors.grey[300],
          child: Center(
            child: Text("Coming Soon",style: TextStyle(
              fontSize: 35
            ),),
          ),
        ),
      ),
    );
  }
}
