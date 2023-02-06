import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_1/singin.dart';
import 'package:test_firebase_1/test_firestore.dart';



class profil extends StatefulWidget {

  @override
  State<profil> createState() => _profilState();
}

class _profilState extends State<profil> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(onPressed: () {
                 Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => firestore()));
            }, icon: Icon(Icons.people))
          ]
          ,title: Center(child: Text("profil")),),

        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(child: Text(user.email!,style: TextStyle(fontSize: 20,color: Colors.black),)),

            TextButton(onPressed: () {FirebaseAuth.instance.signOut();
            Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => singin()));
            }, child: Text("singOut",style: TextStyle(fontSize: 20,color: Colors.black),))
          ],
        ),
      ),
    );
  }
}