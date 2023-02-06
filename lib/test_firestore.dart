import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test_firebase_1/profil.dart';
import 'package:test_firebase_1/singin.dart';

class firestore extends StatefulWidget {
  const firestore({super.key});

  @override
  State<firestore> createState() => _firestoreState();
}

class _firestoreState extends State<firestore> {
  var db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(actions: [
      
        IconButton(
            onPressed: () {
              // Create a new user with a first and last name
              final user = <String, dynamic>{
                "first": "sepol",
                "last": "kamil",
                "born": 2002
              };

// Add a new document with a generated ID
              db.collection("users").add(user).then((DocumentReference doc) =>
                  print('DocumentSnapshot added with ID: ${doc.id}'));
            },
            icon: Icon(Icons.add))
      ]),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
           Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (BuildContext context) => profil()));
        },child: Icon(Icons.people),
      ) ,
      body:
            StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: db.collection("users").snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                } 
                 if (snapshot.hasError) {
                  return Center(child: Text("error"));
                }

                // HASIL DATA DAN DI OLAH
                var _data = snapshot.data!.docs;

                return ListView.builder(
                  itemCount: _data.length,
                  itemBuilder: (context, index) {
                    return ListTile(

                      onTap: () {
                        
                      },
                      onLongPress: () {
                        db.collection("users").doc();
                        _data[index].reference.delete().then((value) => ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("data remove"))));
                      },
                      title: Text("${_data[index].data()["email"]}"),
                    );
                  },
                );
              },
            ),
        
    );
  }
}
