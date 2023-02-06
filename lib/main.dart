import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_1/profil.dart';
import 'package:test_firebase_1/singin.dart';
import 'package:test_firebase_1/test_firestore.dart';


void main ()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(testfire());
}

class testfire extends StatefulWidget {

  @override
  State<testfire> createState() => _testfireState();
}

class _testfireState extends State<testfire> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: StreamBuilder(
        stream: FirebaseAuth.instance.authStateChanges(),
        builder:(context, snapshot) {
          if (snapshot.hasData) {
            return profil();
            
          } else {
            return singin();
          }
          
          // return singin();
        },
      )
    );
  }
}