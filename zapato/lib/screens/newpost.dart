import 'package:flutter/material.dart';
import 'package:zapato/shoeCard.dart';

class Newpost extends StatefulWidget {
  //Newpost({ Key key }) : super(key: key);
  @override
  _NewpostState createState() => new _NewpostState();
}

class _NewpostState extends State<Newpost> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new ListView(
        children: <Widget>[
          // mainUI().mainUIColumn(),
          /**
         * Title
         * **/
          new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Center(
              child: new Text(
                "Title",
                style:
                    new TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
            ),
          ),
          /**
         * Textfield
         * **/
          new Container(
            padding: new EdgeInsets.only(left: 15.0, right: 15.0),
            child: new TextField(
              // controller: _emailController,
              keyboardType: TextInputType.number,
              autofocus: false,
              decoration: InputDecoration(
                  hintText: 'Name, brand, etc.',
                  contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ),
          ),
          /**
         * Textfield
         * **/
          new Container(
            padding: new EdgeInsets.all(15.0),
            child: new Center(
              child: new Text(
                "Images",
                style:
                    new TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
              ),
            ),
          ),
/**
         * Flatbutton
         * **/
          new Container(
              child: new Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Flexible(
                child: new FlatButton(
                  child: new Column(
                    children: <Widget>[
                      new Icon(Icons.camera_alt),
                      new Text("Take a photo")
                    ],
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    print("Taking a photo.");
                  },
                  padding: new EdgeInsets.all(20.0),
                ),
              ),
              new SizedBox(width: 40.0),
              new Flexible(
                child: new FlatButton(
                  child: new Column(
                    children: <Widget>[
                      new Icon(Icons.photo_library),
                      new Text("Add from library")
                    ],
                  ),
                  color: Colors.grey,
                  onPressed: () {
                    print("Adding photo from library");
                  },
                  padding: new EdgeInsets.only(
                      left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
                ),
              ),
            ],
          )),
          new SizedBox(height: 20.0),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.photo,
                  color: Colors.black,
                  size: 170.0,
                ),
                new Icon(
                  Icons.photo,
                  color: Colors.black,
                  size: 170.0,
                ),
              ],
            ),
          ),
          new Container(
            child: new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                new Icon(
                  Icons.photo,
                  color: Colors.black,
                  size: 170.0,
                ),
                new Icon(
                  Icons.photo,
                  color: Colors.black,
                  size: 170.0,
                ),
              ],
            ),
          ),
          new Container(
            // decoration: new BoxDecoration(color: Colors.yellow),
            child: new Row(
              children: <Widget>[
                new Container(
                    padding: new EdgeInsets.only(left: 5.0),
                    alignment: Alignment.centerLeft,
                    // decoration: new BoxDecoration(color: Colors.green),
                    child: new Text(
                      "Cancel",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16.0),
                    )),
                new Expanded(
                  child: new Container(
                    alignment: Alignment.centerRight,
                    // decoration: new BoxDecoration(color: Colors.red),
                    child: new Icon(
                      Icons.chevron_right,
                      color: Colors.black,
                      size: 50.0,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class mainUI {
  Widget mainUIColumn() {
    return Column(
      children: <Widget>[
        // /**
        //  * Title
        //  * **/
        // new Container(
        //   padding: new EdgeInsets.all(15.0),
        //   child: new Text(
        //     "Title",
        //     style: new TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        //   ),
        // ),
        // /**
        //  * Textfield
        //  * **/
        // new Container(
        //   padding: new EdgeInsets.only(left: 15.0, right: 15.0),
        //   child: new TextField(
        //     // controller: _emailController,
        //     keyboardType: TextInputType.number,
        //     autofocus: false,
        //     decoration: InputDecoration(
        //         hintText: 'Name, brand, etc.',
        //         contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        //         border: OutlineInputBorder(borderSide: BorderSide.none)),
        //   ),
        // ),
        // /**
        //  * Textfield
        //  * **/
        // new Container(
        //   padding: new EdgeInsets.all(15.0),
        //   child: new Text(
        //     "Images",
        //     style: new TextStyle(fontWeight: FontWeight.w700, fontSize: 20.0),
        //   ),
        // ),
        // /**
        //  * Flatbutton
        //  * **/
        // new Container(
        //     child: new Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: <Widget>[
        //     new Flexible(
        //       child: new FlatButton(
        //         child: new Column(
        //           children: <Widget>[
        //             new Icon(Icons.camera_alt),
        //             new Text("Take a photo")
        //           ],
        //         ),
        //         color: Colors.grey,
        //         onPressed: () {
        //           print("Taking a photo.");
        //         },
        //         padding: new EdgeInsets.all(20.0),
        //       ),
        //     ),
        //     new SizedBox(width: 40.0),
        //     new Flexible(
        //       child: new FlatButton(
        //         child: new Column(
        //           children: <Widget>[
        //             new Icon(Icons.photo_library),
        //             new Text("Add from library")
        //           ],
        //         ),
        //         color: Colors.grey,
        //         onPressed: () {
        //           print("Adding photo from library");
        //         },
        //         padding: new EdgeInsets.only(
        //             left: 10.0, top: 20.0, right: 10.0, bottom: 20.0),
        //       ),
        //     ),
        //   ],
        // )),
        /**
         * Images
         * **/
        // new SizedBox(height: 20.0),
        // new Container(
        //   child: new Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       new Icon(
        //         Icons.photo,
        //         color: Colors.black,
        //         size: 170.0,
        //       ),
        //       new Icon(
        //         Icons.photo,
        //         color: Colors.black,
        //         size: 170.0,
        //       ),
        //     ],
        //   ),
        // ),
        // new Container(
        //   child: new Row(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: <Widget>[
        //       new Icon(
        //         Icons.photo,
        //         color: Colors.black,
        //         size: 170.0,
        //       ),
        //       new Icon(
        //         Icons.photo,
        //         color: Colors.black,
        //         size: 170.0,
        //       ),
        //     ],
        //   ),
        // ),
        new Expanded(
            child: new Container(
          // decoration: new BoxDecoration(color: Colors.yellow),
          child: new Row(
            children: <Widget>[
              new Container(
                  padding: new EdgeInsets.only(left: 5.0),
                  alignment: Alignment.centerLeft,
                  // decoration: new BoxDecoration(color: Colors.green),
                  child: new Text(
                    "Cancel",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16.0),
                  )),
              new Expanded(
                child: new Container(
                  alignment: Alignment.centerRight,
                  // decoration: new BoxDecoration(color: Colors.red),
                  child: new Icon(
                    Icons.chevron_right,
                    color: Colors.black,
                    size: 50.0,
                  ),
                ),
              )
            ],
          ),
        )),
      ],
    );
  }
}
