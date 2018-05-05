import 'package:flutter/material.dart';
import 'package:zapato/shoe.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'profile.dart';
import 'package:zapato/paymentInfo.dart';

class ProductDetail extends StatefulWidget {
  final Shoe myShoe;

  ProductDetail({Key key, this.myShoe}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return ProductDetailState();
  }
}

class ProductDetailState extends State<ProductDetail> {
  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    final shoeTitle = "YEEZY BOOST 350 V2".toUpperCase();
    final priceSubtitle =
        "Price: \$${widget.myShoe.price} | Condition: ${widget.myShoe.shoeCondition}";
    final productDescription =
        'Selling my ${widget.myShoe.name} for ${widget.myShoe.price}. ${widget.myShoe.shoeCondition} condition. Worn only twice. Buy dis.';
    final sellerName = 'YeezyLord92';
    double sellerRating = 4.5;
    final String customerImageUrl =
        'https://www.thefamouspeople.com/profiles/images/kanye-west-2.jpg';

    Widget myIcon(IconData icon, double size, Color color) {
      return new Icon(
        icon,
        size: size,
        color: color,
      );
    }

    void _paymentInfo() {
      print('new pop up view');
      var route = new MaterialPageRoute(builder: (BuildContext context) {
        return new PaymentInfo(myShoe: widget.myShoe);
      });
      Navigator.of(context).push(route);
    }

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('${widget.myShoe.name}'),
      ),
      body: Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.only(top: 5.0, bottom: 5.0),
            height: screenHeight * 0.4,
            // decoration: new BoxDecoration(color: Colors.red),
            child: new Stack(
              children: <Widget>[
                new Center(
                  child: new Image(
                    image: new CachedNetworkImageProvider(
                        widget.myShoe.shoeImageUrl),
                  ),
                ),
                new Container(
                  child: myIcon(Icons.arrow_left, 80.0, Colors.blue[200]),
                  alignment: Alignment.centerLeft,
                ),
                new Container(
                  // decoration: new BoxDecoration(color: Colors.green),
                  child: myIcon(Icons.arrow_right, 80.0, Colors.blue[50]),
                  alignment: Alignment.centerRight,
                ),
                new Container(
                  // decoration: new BoxDecoration(color: Colors.green),
                  child: myIcon(Icons.more_horiz, 40.0, Colors.blue[200]),
                  alignment: Alignment.bottomCenter,
                ),
                new Container(
                  alignment: Alignment.bottomRight,
                  child: new IconButton(
                    icon: new CircleAvatar(
                      child:
                          myIcon(Icons.add_shopping_cart, 25.0, Colors.white),
                      backgroundColor: Colors.lightBlue,
                      radius: 30.0,
                    ),
                    //payment function
                    onPressed: (){
                      _paymentInfo();
                    },
                    iconSize: 60.0,
                  ),
                )
              ],
            ),
          ),
          new Expanded(
            flex: 1,
            child: new Container(
                padding: new EdgeInsets.all(10.0),
                alignment: Alignment.topLeft,
                // decoration: new BoxDecoration(color: Colors.green),
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    new Icon(
                      Icons.check_circle,
                      color: Colors.brown,
                    ),
                    new Expanded(
                      child: new Container(
                        // decoration: new BoxDecoration(color: Colors.green),
                        child: new Column(
                          // mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            new Text(
                              shoeTitle,
                              style: new TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                  fontStyle: FontStyle.italic),
                              softWrap: true,
                            ),
                            new SizedBox(height: .50),
                            new Text(
                              priceSubtitle,
                              style: new TextStyle(
                                  fontWeight: FontWeight.w600, fontSize: 17.0),
                              softWrap: true,
                            ),
                            new SizedBox(height: .50),
                            new Text(productDescription,
                                style: new TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.0,
                                    color: Colors.black54),
                                softWrap: true),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
          ),
          new Expanded(
            child: new ListView(
              children: <Widget>[
                new Container(
                  child: new Text('Sold by',
                      style: new TextStyle(fontWeight: FontWeight.bold)),
                  padding: new EdgeInsets.only(left: 15.0),
                ),
                TheFeedback().feedbakComment(
                    sellerName, '', sellerRating, customerImageUrl),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
