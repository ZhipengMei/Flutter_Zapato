// // import 'dart:async';
// // import 'dart:io' show Platform;

// // import 'package:flutter/material.dart';
// // import 'package:firebase_core/firebase_core.dart';
// // import 'package:firebase_database/firebase_database.dart';
// // import 'package:firebase_database/ui/firebase_animated_list.dart';
// import 'package:firebase_auth/firebase_auth.dart';

// final FirebaseAuth _auth = FirebaseAuth.instance;

// class Database {

//   // static Future<DataSnapshot> fetchAllShoes() async {

//   //   final FirebaseUser currentUser = await _auth.currentUser(); //get current user
//   //   final reference = FirebaseDatabase.instance.reference().child('shoes'); //get database reference

//   //   Map returnedSnapshot; //placeholder for later return data
    
//   //   await reference
//   //   .reference()
//   //   .child(currentUser.uid)
//   //   .once()
//   //   .then((DataSnapshot snapshot) {
//   //     // print('Connected to second database and read ${snapshot.value}');
//   //     returnedSnapshot = snapshot;
//   //     Map data = snapshot.value;
          
//   //   });



//   //   // print(returnedSnapshot.value);
//   //   return returnedSnapshot;
//   // }

// }

// // class Shoe {
// //   final String key;
// //   String name;

// //   Shoe.fromJson(this.key, Map data) {
// //     name = data['name'];
// //     if (name == null) {
// //       name = '';
// //     }
// //   }
// // }