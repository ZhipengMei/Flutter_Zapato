import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

class Profile extends StatelessWidget {
  //signout method
  Future<Null> _signOut(BuildContext context) async {
    await _googleSignIn.signOut(); //sign out of google
    await _auth.signOut(); //sign out of firebase
    print('User signout');
    Navigator
        .of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }

  //final url 
  // bool something = _googleSignIn.currentUser.photoUrl ?? false;
  

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Column(
      children: <Widget>[
        new Container(
          child: new Center(
            child: new Icon(
              Icons.person,
              size: 150.0,
              color: Colors.brown,
            ),
          ),
        ),
        new Container(
            // margin: const EdgeInsets.only(right: 0.0),
            // child: new Text(_googleSignIn.currentUser.photoUrl),
            child: new CircleAvatar(
              backgroundImage: // modified
                new NetworkImage('https://avatars1.githubusercontent.com/u/19496965?s=400&u=b0535ec464c4495867efb2a9b8f999493b7ed8ae&v=4'),
                radius: 60.0,
                ),
            ),
        new Center(
            child: new RaisedButton(
          child: new Text('Logout'),
          onPressed: () {
            _signOut(context);
          },
        ))
      ],
    );
  }
}
