import 'package:flutter/material.dart';
import 'package:zapato/shoe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:ui' as ui;

class PaymentInfo extends StatefulWidget {
  final Shoe myShoe;
  PaymentInfo({Key key, this.myShoe}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return PaymentInfoState();
  }
}

class PaymentInfoState extends State<PaymentInfo> {
  Widget imageContainer() {
    return new Container(
      padding: new EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: new Stack(
        children: <Widget>[
          new Center(
            child: new Image(
              image: new CachedNetworkImageProvider(widget.myShoe.shoeImageUrl),
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final shoeTitle = "YEEZY BOOST 350 V2".toUpperCase();
    // final priceSubtitle =
    //     "Price: \$${widget.myShoe.price} | Condition: ${widget.myShoe.shoeCondition}";
    // final productDescription =
    //     'Selling my ${widget.myShoe.name} for ${widget.myShoe.price}. ${widget.myShoe.shoeCondition} condition. Worn only twice. Buy dis.';
    // final sellerName = 'YeezyLord92';
    // double sellerRating = 4.5;
    final String customerImageUrl =
        'https://www.thefamouspeople.com/profiles/images/kanye-west-2.jpg';

    // Main UI
    return new Scaffold(
      appBar: new AppBar(title: new Text('BUY')),
      body: new Column(
        children: <Widget>[
          new Container(
            height: MediaQuery.of(context).size.height * 0.4,
            child: new Stack(
              children: <Widget>[
                /*
                Dim image/shoe info Section
                */
                new Container(
                  // decoration: new BoxDecoration(color: Colors.red),
                  child: imageContainer(),
                ),
                new Container(
                  decoration: new BoxDecoration(color: Colors.black54),
                ),
                new Container(
                  alignment: Alignment.center,
                  child: new ListTile(
                    title: new Column(
                      children: <Widget>[
                        new Text(
                          widget.myShoe.name,
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,
                          ),
                        ),
                        new SizedBox(height: 15.0),
                        new Text(
                          'SIZE ${widget.myShoe.size} / ${widget.myShoe.shoeCondition} / \$${widget.myShoe.price}'
                              .toUpperCase(),
                          style: new TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 17.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          /*
          Payment Section
          */
          new Expanded(
              child: new Container(
            child: new Center(
              child: new Text('Payment info here'),
            ),
          )),
        ],
      ),
    );
  }
}
