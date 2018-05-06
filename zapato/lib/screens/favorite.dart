import 'package:flutter/material.dart';
import 'package:zapato/shoe.dart';
import 'package:zapato/shoeCard.dart';
import 'home.dart';

class Favorite extends StatefulWidget {
  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return FavoriteState();
    }
}

class FavoriteState extends State<Favorite> {
  List<Shoe> favShoesList = new List<Shoe>();

  @override
    void initState() {
      super.initState();
      favShoesList = HomeState().getShoesList();
    }

  @override
    Widget build(BuildContext context) {
      return TheGridView().bookmarkBuild(favShoesList, context);
    }
}