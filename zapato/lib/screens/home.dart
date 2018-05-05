import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zapato/shoe.dart';
import 'package:zapato/shoeCard.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart'; //new

final FirebaseAuth _auth = FirebaseAuth.instance;
final reference = FirebaseDatabase.instance
    .reference()
    .child('shoes'); //get database reference

List<Shoe> shoesList = new List<Shoe>();

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new HomeState();
  }
}

class HomeState extends State<Home> {

  @override
  void initState() {
    super.initState();

    if (shoesList.isEmpty) {
      fetchAllShoes();
    }
  }

  void fetchAllShoes() async {
    final FirebaseUser currentUser = await _auth.currentUser();

    List<Shoe> _newShoesList = new List<Shoe>();
    reference.child(currentUser.uid).onValue.listen((e) {
      DataSnapshot data = e.snapshot;
      shoesList.clear(); //empty the shoeList
      Map val = data.value;
      val.forEach((key, value) {
        Shoe _shoe = new Shoe();
        _shoe.parseJson(value);
        _newShoesList.add(_shoe);
      });

      //save the data
      setState(() {
        shoesList = _newShoesList;
      });
    });
  }

  //getter for other class to obtain shoeList 
  List<Shoe> getShoesList() {
    return shoesList;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TheGridView().build(shoesList, context);
  }
}
