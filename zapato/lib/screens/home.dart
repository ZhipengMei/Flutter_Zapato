import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:zapato/shoe.dart';
// import 'package:firebase_database/ui/firebase_animated_list.dart'; //new

final FirebaseAuth _auth = FirebaseAuth.instance;
final reference = FirebaseDatabase.instance
    .reference()
    .child('shoes'); //get database reference

List<Shoe> shoesList = new List<Shoe>();

class Home extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
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

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TheGridView().build();
  }
}

//configure the UI here
class TheGridView {
  Card makeGridView(Shoe shoe) {
    return Card(
      elevation: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          SizedBox(height: 14.0), //creating empty space
          
          new Stack(
            children: <Widget>[              
              Center(child: new Image.network(shoe.shoeImageUrl, scale: 3.0),),              
              new Container(
                padding: new EdgeInsets.only(left: 120.0),
                child: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    radius: 25.0,
                    child: new Text("\$130",
                        style: new TextStyle(
                            color: Colors.white, fontSize: 13.0))),
              ),
            ],
          ),

          SizedBox(height: 24.0),

          Center(
              child: Text(
            shoe.name,
            style: new TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
          )),

          SizedBox(height: 4.0),
        ],
      ),
    );
  }

  GridView build() {
    return GridView.count(
        primary: true,
        padding: EdgeInsets.all(1.0),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: shoesList.map((Shoe shoe) {
          return TheGridView().makeGridView(shoe);
        }).toList());

    // .map((String url) {
    //   return new GridTile(child: new Image.network(url, fit: BoxFit.cover));
    // }).toList());
  }
}
