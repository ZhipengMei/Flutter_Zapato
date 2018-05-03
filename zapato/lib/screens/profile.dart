import 'dart:async';

import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();

class Profile extends StatelessWidget {
  
  //signout method
  Future<Null> _signOut(BuildContext context) async {    
    await _googleSignIn.signOut();//sign out of google
    await _auth.signOut(); //sign out of firebase    
    print('User signout');
    Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);  
  }

  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Column(
        children: <Widget>[
          new Container(
            child: new Center(
              child: new Icon(Icons.person, size:150.0, color: Colors.brown,),                    
            ),          
          ),
          new Center(
            child: new RaisedButton(
              child: new Text('Logout'),
              onPressed: (){
                _signOut(context);
              },
            )
          )
        ],
      );
    }
}