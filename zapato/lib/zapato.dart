import 'dart:async';
import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/search.dart';
import './screens/newpost.dart';
import './screens/favorite.dart';
import './screens/profile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

final FirebaseAuth _auth = FirebaseAuth.instance;
final GoogleSignIn _googleSignIn = new GoogleSignIn();
enum TestEnum { A }

class Zapato extends StatefulWidget {
  static String tag = 'Zapato';
  @override
  State<StatefulWidget> createState() {
    return ZapatoState();
  }
}

class ZapatoState extends State<Zapato> with SingleTickerProviderStateMixin {
  MyTabs _myHandler;
  TabController _tabController;

  //signout method
  static Future<Null> _signOut(BuildContext context) async {
    await _googleSignIn.signOut(); //sign out of google
    await _auth.signOut(); //sign out of firebase
    print('User signout');
    Navigator
        .of(context)
        .pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
  }

  List<MyTabs> _tabTitlesIcons = [
    new MyTabs(title: 'Zapato', popupmenubutton: new IconButton(icon: new Icon(null),onPressed: null,)),
    new MyTabs(title: 'Search', popupmenubutton: new IconButton(icon: new Icon(null),onPressed: null,)),
    new MyTabs(title: 'Sell', popupmenubutton: new IconButton(icon: new Icon(null),onPressed: null,)),    
    new MyTabs(title: 'Favorite', popupmenubutton: new IconButton(icon: new Icon(null),onPressed: null,)),
    new MyTabs(
        title: 'Profile',
        popupmenubutton: new PopupMenuButton(
            itemBuilder: (BuildContext context){
              return <PopupMenuEntry<TestEnum>> [
                new PopupMenuItem(
                  child: new FlatButton(
                    child: new Text('Logout'),
                    onPressed: (){
                      _signOut(context);
                    },
                  ),
                )
              ];
            },
          )
      )
  ];

  void _handleSelected() {
    setState(() {
      _myHandler = _tabTitlesIcons[_tabController.index];
    });
  }

  @override
  void initState() {
    super.initState();

    _tabController = new TabController(vsync: this, length: 5);
    _myHandler = _tabTitlesIcons[0];
    _tabController.addListener(_handleSelected);
    //upload data to firestore database
    // Firestore.instance.collection('books').document().setData({ 'title': 'ggg', 'author': 'gggg vool' });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(_myHandler.title),
        actions: <Widget>[_myHandler.popupmenubutton],
      ),
      bottomNavigationBar: new Material(
        color: Colors.blue,
        child: new TabBar(
          controller: _tabController,
          tabs: <Widget>[
            new Tab(
              icon: new Icon(Icons.home),
            ),
            new Tab(
              icon: new Icon(Icons.search),
            ),
            new Tab(
              icon: new Icon(Icons.add),
            ),
            new Tab(
              icon: new Icon(Icons.favorite),
            ),
            new Tab(
              icon: new Icon(Icons.person),
            )
          ],
        ),
      ),
      body: new TabBarView(
        controller: _tabController,
        children: <Widget>[
          //
          new Home(),
          // new Search(),
          new SearchList(),
          new Newpost(),
          new Favorite(),
          new Profile()
        ],
      ),
    );
  }

}

class MyTabs {
  final String title;   
  var popupmenubutton;  
  MyTabs({this.title, this.popupmenubutton});
}
