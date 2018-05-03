import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new TheGridView().build();
    }
}

class TheGridView {
  Card makeGridView(String name, IconData icon) {
    return Card(
      elevation: 1.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisSize: MainAxisSize.min,
        verticalDirection: VerticalDirection.down,
        children: <Widget>[
          Center(child: Icon(icon)),
          Center(child: Text(name))          
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
      children: <Widget>[
        makeGridView('Home', Icons.home),
        makeGridView('Home', Icons.home),
        makeGridView('Home', Icons.home),
        makeGridView('Home', Icons.home),
        makeGridView('Home', Icons.home),
        makeGridView('Home', Icons.home),
        makeGridView('Home', Icons.home),
      ],
    );
  }
}