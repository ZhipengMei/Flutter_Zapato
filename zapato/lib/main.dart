import 'package:flutter/material.dart';
import 'login.dart';
import 'zapato.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    '/login': (context) => LoginPage(),
    '/zapato': (context) => Zapato(),
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kodeversitas',
      // debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        // fontFamily: 'Nunito',
      ),
      routes: routes,
      home: LoginPage(),              
    );
  }
}
