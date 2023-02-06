import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_1/profil.dart';
import 'package:test_firebase_1/singUp.dart';


class singin extends StatefulWidget {

  @override
  State<singin> createState() => _singinState();
}

class _singinState extends State<singin> {


final emailC = TextEditingController();
final passC = TextEditingController();

@override
void dispose(){
emailC.dispose();
passC.dispose();
super.dispose();
}

Future<void> singIn()async{
  await FirebaseAuth.instance.signInWithEmailAndPassword(
    email: emailC.text.trim(), 
    password: passC.text.trim()
    );
    Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => profil()));
}

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(title: Center(child: Text("singin")),),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: emailC,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(label: Text("Email")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: passC,
                keyboardType: TextInputType.visiblePassword,

                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(label: Text("Password")),
              ),
            ),
            ElevatedButton(onPressed: singIn, 
            child: Text("Login")
            ),
            ElevatedButton(onPressed: () {
               Navigator.of(context).push(
            MaterialPageRoute(builder: (BuildContext context) => singup()));
            }, child: Text("singUp"))
          ],
        ),
      )
    );
  }
}