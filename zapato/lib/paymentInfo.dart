import 'package:flutter/material.dart';
import 'package:zapato/shoe.dart';

class PaymentInfo extends StatefulWidget {
  final Shoe myShoe;
  PaymentInfo({Key key, this.myShoe}) : super(key: key);

  @override
    State<StatefulWidget> createState() {
      // TODO: implement createState
      return  PaymentInfoState();
    }
}

class PaymentInfoState extends State<PaymentInfo> {
  @override
    Widget build(BuildContext context) {
      // TODO: implement build
      return new Scaffold(
        appBar: new AppBar(title: new Text('BUY')),
        body: new Center(child: new Text('Buying...'),),
      );
    }
}