import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';


final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();
//global current user object
// FirebaseUser c_user;

//Google sign in method
// Future<String> _testSignInWithGoogle(BuildContext context) async {
Future<Null> _testSignInWithGoogle(BuildContext context) async {

  GoogleSignInAccount googleUser = _googleSignIn.currentUser;
  if (googleUser == null)
    googleUser = await _googleSignIn.signInSilently();
  if (googleUser == null) {
    await _googleSignIn.signIn();
  }

  // final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
  final GoogleSignInAuthentication googleAuth =
      await googleUser.authentication;
  final FirebaseUser user = await _auth.signInWithGoogle(    
    accessToken: googleAuth.accessToken,
    idToken: googleAuth.idToken,
  );
  assert(user.email != null);
  assert(user.displayName != null);
  assert(!user.isAnonymous);
  assert(await user.getIdToken() != null);

  final FirebaseUser currentUser = await _auth.currentUser();
  assert(user.uid == currentUser.uid);

  print('Success: *** User (${user.displayName}) is signed in. ***');
  // print(_googleSignIn.currentUser.photoUrl);
  // print(currentUser.uid);

  //move to another view when user is signed in
  if (user.displayName.isNotEmpty )
    Navigator.of(context).pushNamedAndRemoveUntil('/zapato', (Route<dynamic> route) => false);
  
  // return 'signInWithGoogle succeeded: $user';
  // return user;
}

class LoginPage extends StatefulWidget {
  static String tag = 'login';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  String emailValue = "";
  String passValue = "";

  final TextEditingController _emailController = new TextEditingController();
  final TextEditingController _passController = new TextEditingController();

  //TODO
  void _loginLogic() {    
    if (emailValue == 'aaa' && passValue == 'aaa') {
      Navigator.of(context).pushNamedAndRemoveUntil('/zapato', (Route<dynamic> route) => false);// pushNamed('zapato');
    } else {
      //TODO, make textfield shake(animaton) to indicate incorrect info
      print('Incorrect info');
    }
  }

  void _onChanged(String v1, String v2) {
    setState(() {
      emailValue = v1;
      passValue = v2;
    });
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        // child: Image.asset('assets/logo.png'),
        child: Image.asset('assets/zapato_logo.jpg'),        
      ),
    );

    final email = new TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      decoration: InputDecoration(
        hintText: 'Email',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final password = TextField(
      autofocus: false,
      obscureText: true,
      controller: _passController,
      decoration: InputDecoration(
        hintText: 'Password',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            //Login function call here
            _onChanged(_emailController.text, _passController.text);
            _loginLogic();
          },
          color: Colors.lightBlueAccent,
          child: Text('Log In', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {
        //TODO Forgot password function here
      },
    );

    final googleSigninButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Material(
        borderRadius: BorderRadius.circular(30.0),
        shadowColor: Colors.lightBlueAccent.shade100,
        elevation: 5.0,
        child: MaterialButton(
          minWidth: 200.0,
          height: 42.0,
          onPressed: () {
            //Login function call here
            print('Sign in with google');
            _testSignInWithGoogle(context);            
          },
          color: Colors.blueAccent,
          child: Text('Sign in with Google', style: TextStyle(color: Colors.white)),
        ),
      ),
    );

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.only(left: 24.0, right: 24.0),
          children: <Widget>[
            logo,
            SizedBox(height: 48.0),
            email,
            SizedBox(height: 8.0),
            password,
            SizedBox(height: 24.0),
            loginButton,
            forgotLabel,
            SizedBox(height: 24.0),
            new Divider(height: 5.0, color: Colors.grey,),
            googleSigninButton
          ],
        ),
      ),
    );
  }
}
