import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_1/profil.dart';
import 'package:test_firebase_1/singin.dart';

class singup extends StatefulWidget {
  @override
  State<singup> createState() => _singupState();
}

class _singupState extends State<singup> {
  var db = FirebaseFirestore.instance;

  final emailCe = TextEditingController();
  final passCa = TextEditingController();
  final namaCa = TextEditingController();
  final alamatCa = TextEditingController();
  final nohpCa = TextEditingController();
  final userCa = TextEditingController();


  Future daftar() async {

    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailCe.text.trim(), 
        password: passCa.text.trim());

    final user = <String, dynamic>{
      "Nama": "${namaCa.text}",
      "Alamat": "${alamatCa.text}",
      "Nomor Hp": "${nohpCa.text}",
      "Username": "${userCa.text}",
      "email": "${emailCe.text}",
      "pass": "${passCa.text}",
    };

    db.collection("users").add(user).then((DocumentReference doc) =>
        print('DocumentSnapshot added with ID: ${doc.id}'));

          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => profil()));
    } catch (e) {
      print(e);
    }
    
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        appBar: AppBar(
          title: Text("singup"),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: namaCa,
                keyboardType: TextInputType.name,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(label: Text("nama")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: alamatCa,
                keyboardType: TextInputType.streetAddress,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(label: Text("alamat")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: nohpCa,
                keyboardType: TextInputType.phone,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(label: Text("Nomor hp")),
              ),
            ),
              Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: userCa,
                keyboardType: TextInputType.name,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(label: Text("username")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: emailCe,
                keyboardType: TextInputType.emailAddress,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(label: Text("Email")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: TextField(
                controller: passCa,
                keyboardType: TextInputType.visiblePassword,
                cursorColor: Colors.white,
                textInputAction: TextInputAction.next,
                decoration: InputDecoration(label: Text("Password")),
              ),
            ),
          
            ElevatedButton(onPressed: daftar, child: Text("singUp"))
          ],
        ),
      ),
    );
  }
}
