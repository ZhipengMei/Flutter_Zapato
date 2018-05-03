import 'package:flutter/material.dart';

class Search extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return new SearchState();
    }
}

class SearchState extends State<Search> {

  @override
    void initState() {
      super.initState();      
    }

  @override
    void dispose() {
      super.dispose();
    }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new Container(
      child: new Center(
        child: new Icon(Icons.search, size:150.0, color: Colors.brown,),
      ),
    );
  }
}