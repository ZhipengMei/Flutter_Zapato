import 'package:flutter/material.dart';
import './screens/home.dart';
import './screens/search.dart';
import './screens/newpost.dart';
import './screens/favorite.dart';
import './screens/profile.dart';

import 'package:cloud_firestore/cloud_firestore.dart';

class Zapato extends StatefulWidget {
  static String tag = 'Zapato';
  @override
    State<StatefulWidget> createState() {
      return ZapatoState();
    }
}

class ZapatoState extends State<Zapato> with SingleTickerProviderStateMixin{

  TabController _tabController;

  @override
    void initState() {      
      super.initState();
      _tabController = new TabController(vsync: this, length: 5);

      Firestore.instance.collection('books').document().setData({ 'title': 'ggg', 'author': 'gggg vool' });
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
          title: new Text('Zapato'),
        ),
        bottomNavigationBar: new Material(
          color: Colors.blue,
          child: new TabBar(
            controller: _tabController,
            tabs: <Widget>[
              new Tab(icon: new Icon(Icons.home),),
              new Tab(icon: new Icon(Icons.search),),
              new Tab(icon: new Icon(Icons.add),),
              new Tab(icon: new Icon(Icons.favorite),),
              new Tab(icon: new Icon(Icons.person),)
            ],
          ),
        ),
        body: new TabBarView(
          controller: _tabController,
          children: <Widget>[
            //
            new Home(),
            new Search(),
            new Newpost(),
            new Favorite(),
            new Profile()
          ],
        ),
      );
    }
}