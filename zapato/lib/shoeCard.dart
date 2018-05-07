import 'package:flutter/material.dart';
import 'shoe.dart';
import './screens/product_detail.dart';

//configure the UI here
class TheGridView {
  //card
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
              Center(
                child: new Image.network(shoe.shoeImageUrl, scale: 3.0),
              ),
              new Container(
                alignment: Alignment.topRight,
                child: CircleAvatar(
                    backgroundColor: Colors.lightBlue,
                    radius: 25.0,
                    child: new Text("\$${shoe.price}",
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
        ],
      ),
    );
  }

  //ListTile
  GridTile makeGridTileView(Shoe shoe, BuildContext context) {
    return GridTile(
      child: new InkResponse(
        child: new Card(
          elevation: 1.0,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              new Stack(
                children: <Widget>[
                  Center(
                    child: new Image.network(shoe.shoeImageUrl, scale: 3.0),
                  ),
                  new Container(
                    alignment: Alignment.topRight,
                    // padding: new EdgeInsets.only(left: 120.0),
                    child: CircleAvatar(
                        backgroundColor: Colors.lightBlue,
                        radius: 25.0,
                        child: new Text("\$${shoe.price}",
                            style: new TextStyle(
                                color: Colors.white, fontSize: 13.0))),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Center(
                  child: Text(
                shoe.name,
                style:
                    new TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
              )),
            ],
          ),
        ),
        onTap: () {
          var route = new MaterialPageRoute(builder: (BuildContext context) {
            return new ProductDetail(myShoe: shoe);
          });
          Navigator.of(context).push(route);
        },
      ),
    );
  }

  //bookmarked
  GridTile bookmarkGridTileView(Shoe shoe, BuildContext context) {
    return GridTile(
      child: new InkResponse(
        child: new Card(
          elevation: 1.0,
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              new Stack(
                children: <Widget>[
                  Center(
                    child: new Image.network(shoe.shoeImageUrl, scale: 3.0),
                  ),
                  new Container(
                    alignment: Alignment.topRight,
                    // padding: new EdgeInsets.only(left: 120.0),
                    child: new Icon(
                      // Icons.favorite,
                      Icons.bookmark,
                      color: Colors.red,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 24.0),
              Center(
                  child: Text(
                shoe.name,
                style:
                    new TextStyle(fontWeight: FontWeight.w500, fontSize: 15.0),
              )),
            ],
          ),
        ),
        onTap: () {
          var route = new MaterialPageRoute(builder: (BuildContext context) {
            return new ProductDetail(myShoe: shoe);
          });
          Navigator.of(context).push(route);
        },
      ),
    );
  }

  GridView build(List<Shoe> shoesList, BuildContext context) {
    return GridView.count(
        primary: true,
        padding: EdgeInsets.all(1.0),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: shoesList.map((Shoe shoe) {
          // return TheGridView().makeGridView(shoe);
          return TheGridView().makeGridTileView(shoe, context);
        }).toList());
  }

  GridView bookmarkBuild(List<Shoe> shoesList, BuildContext context) {
    return GridView.count(
        primary: true,
        padding: EdgeInsets.all(1.0),
        crossAxisCount: 2,
        childAspectRatio: 1.0,
        mainAxisSpacing: 1.0,
        crossAxisSpacing: 1.0,
        children: shoesList.map((Shoe shoe) {
          return TheGridView().bookmarkGridTileView(shoe, context);
        }).toList());
  }
}
