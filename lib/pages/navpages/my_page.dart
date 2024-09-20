import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class MyPage extends StatefulWidget {
  const MyPage({super.key});

  @override
  State<MyPage> createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  final user = FirebaseAuth.instance.currentUser;
  // List of Document Ids
  List<String> DocId = [];
  // Get Document Ids
  Future GetDocId ()async{
    await FirebaseFirestore.instance.collection("user").get().then(
            (Snapshot) => Snapshot.docs.forEach((document) {
              print(document.reference);
              DocId.add(document.reference.id);
            })
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Signed In A user: ${user?.email ?? 'Unknown'}"),

            Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.0),
                child: Ink(
                  decoration: BoxDecoration(
                    color: Colors.deepPurple[300],
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: InkWell(

                    onTap:(){
                      FirebaseAuth.instance.signOut();
                    },
                    child: Container(
                      width: double.maxFinite,
                      padding: const EdgeInsets.all(15),
                      child: Center(
                        child: Text(
                          "Sign Out",
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
            Expanded(child: FutureBuilder(
                future: GetDocId(),
                builder:(context,Snapshot){
              return ListView.builder
                (itemCount: DocId.length,
                  itemBuilder:(context,index){
                    return ListTile(title: Text(DocId[index]),);
                  }
              );
            }
            )
            )


          ],
        ),

      ) ,
    );
  }
}
