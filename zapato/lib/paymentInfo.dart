import 'package:flutter/material.dart';
import 'package:zapato/shoe.dart';
import 'package:cached_network_image/cached_network_image.dart';
// import 'dart:ui' as ui;

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
  //parameter for stripe
  // String _cardFullname, _cardNumber, _cardCvv, _cardExpDate;
  // String _shippingFullname,
  //     _shippingPhoneNumber,
  //     _shippingStreet,
  //     _shippingApartmentUnit,
  //     _shippingCity,
  //     _shippingPostalCode;

  // void _onChanged(String value) {
  //   setState(() {
  //     //card
  //     _cardFullname = _cardFullnameCtrl.text;
  //     _cardNumber = _cardNumberCtrl.text;
  //     _cardCvv = _cardCvvCtrl.text;
  //     _cardExpDate = _cardExpDateCtrl.text;
  //     //shipping
  //     _shippingFullname = _shippingFullnameCtrl.text;
  //     _shippingPhoneNumber = _shippingPhoneNumberCtrl.text;
  //     _shippingStreet = _shippingStreetCtrl.text;
  //     _shippingApartmentUnit = _shippingApartmentUnitCtrl.text;
  //     _shippingCity = _shippingCityCtrl.text;
  //     _shippingPostalCode = _shippingPostalCodeCtrl.text;
  //   });
  //   print('?? $value');
  //   print('_cardFullname: $_cardFullname');
  //   print(_cardFullnameCtrl.text);
  // }

  // static final TextEditingController _cardFullnameCtrl,
  //     _cardNumberCtrl,
  //     _cardCvvCtrl,
  //     _cardExpDateCtrl = new TextEditingController();
  // static final TextEditingController _shippingFullnameCtrl,
  //     _shippingPhoneNumberCtrl,
  //     _shippingStreetCtrl,
  //     _shippingApartmentUnitCtrl,
  //     _shippingCityCtrl,
  //     _shippingPostalCodeCtrl = new TextEditingController();

  //top image widget
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

  // final creditFullname = new TextField(
  //   controller: _cardFullnameCtrl,
  //   keyboardType: TextInputType.emailAddress,
  //   autofocus: false,
  //   onChanged: (String value){_onChanged();},
  //   decoration: InputDecoration(
  //       hintText: 'Full Name (on card)',
  //       contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
  //       // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
  //       border: OutlineInputBorder(borderSide: BorderSide.none)),
  // );

  Widget creditFullname() {
    return new TextField(
      // controller: _cardFullnameCtrl,
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      onChanged: (String value) {
        // _onChanged(value);
        print('inside $value');
      },
      decoration: InputDecoration(
          hintText: 'Full Name (on card)',
          contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
          // border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
          border: OutlineInputBorder(borderSide: BorderSide.none)),
    );
  }

  final creditNumber = new TextField(
    // controller: _emailController,
    keyboardType: TextInputType.number,
    autofocus: false,
    decoration: InputDecoration(
        hintText: 'Credit Card Number',
        // contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderSide: BorderSide.none)),
  );

  final cardCvv = new TextField(
    // controller: _emailController,
    keyboardType: TextInputType.number,
    autofocus: false,
    decoration: InputDecoration(
        hintText: 'CVV',
        contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 10.0),
        border: OutlineInputBorder(borderSide: BorderSide.none)),
  );

  final cardExpDate = new TextField(
    // controller: _emailController,
    keyboardType: TextInputType.number,
    autofocus: false,
    decoration: InputDecoration(
        hintText: 'Exp Date: MM/YYYY',
        contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        border: OutlineInputBorder(borderSide: BorderSide.none)),
  );

  //mid credit card info widget
  Widget creditInfoContainer() {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      // decoration: new BoxDecoration(color: Colors.red),
      // height: MediaQuery.of(context).size.width * 0.5,
      height: MediaQuery.of(context).size.height * 0.25,
      child: new Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(8.0),
            // decoration: new BoxDecoration(color: Colors.yellow),
            child: new Text(
              'add creadit card'.toUpperCase(),
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 13.0),
            ),
          ),
          new Flexible(
            child: new Container(
              padding: new EdgeInsets.all(5.0),
              // decoration: new BoxDecoration(color: Colors.orange),
              // child: new TextField(),
              child: creditFullname(),
            ),
          ),
          new Flexible(
            child: new Container(
              padding: new EdgeInsets.all(5.0),
              // decoration: new BoxDecoration(color: Colors.blue),
              child: creditNumber,
            ),
          ),
          new Expanded(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Flexible(
                  child: new Container(
                    padding: new EdgeInsets.all(5.0),
                    // decoration: new BoxDecoration(color: Colors.purple),
                    child: cardCvv,
                  ),
                ),
                new Flexible(
                  child: new Container(
                    padding: new EdgeInsets.all(5.0),
                    // decoration: new BoxDecoration(color: Colors.pink),
                    child: cardExpDate,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /*
  shipping info mini widget
  */
  final shippingFullname = new TextField(
    // controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    decoration: InputDecoration(
        hintText: 'Full Name',
        contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        border: OutlineInputBorder(borderSide: BorderSide.none)),
  );
  final shippingPhonenumber = new TextField(
    // controller: _emailController,
    keyboardType: TextInputType.number,
    autofocus: false,
    decoration: InputDecoration(
        hintText: 'Phone Number',
        contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        border: OutlineInputBorder(borderSide: BorderSide.none)),
  );
  final shippingStreet = new TextField(
    // controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    decoration: InputDecoration(
        hintText: 'Street Address',
        contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        border: OutlineInputBorder(borderSide: BorderSide.none)),
  );
  final shippingApartmentUnit = new TextField(
    // controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    decoration: InputDecoration(
        hintText: 'Apt./Unit',
        contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        border: OutlineInputBorder(borderSide: BorderSide.none)),
  );
  final shippingCity = new TextField(
    // controller: _emailController,
    keyboardType: TextInputType.emailAddress,
    autofocus: false,
    decoration: InputDecoration(
        hintText: 'City',
        contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        border: OutlineInputBorder(borderSide: BorderSide.none)),
  );
  final shippingPostalCode = new TextField(
    // controller: _emailController,
    keyboardType: TextInputType.number,
    autofocus: false,
    decoration: InputDecoration(
        hintText: 'Postal Code',
        contentPadding: EdgeInsets.fromLTRB(5.0, 10.0, 5.0, 10.0),
        border: OutlineInputBorder(borderSide: BorderSide.none)),
  );
  
  //bottom shipping info widget
  Widget shippingInfoContainer() {
    return new Container(
      padding: new EdgeInsets.all(10.0),
      // decoration: new BoxDecoration(color: Colors.red),
      height: MediaQuery.of(context).size.width * 0.6,
      child: new Column(
        children: <Widget>[
          new Container(
            padding: new EdgeInsets.all(8.0),
            // decoration: new BoxDecoration(color: Colors.yellow),
            child: new Text(
              'shipping address'.toUpperCase(),
              style: new TextStyle(
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2.0,
                  fontSize: 13.0),
            ),
          ),
          new Expanded(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Flexible(
                  child: new Container(
                    padding: new EdgeInsets.all(5.0),
                    // decoration: new BoxDecoration(color: Colors.purple),
                    child: shippingFullname,
                  ),
                ),
                new Flexible(
                  child: new Container(
                    padding: new EdgeInsets.all(5.0),
                    // decoration: new BoxDecoration(color: Colors.pink),
                    child: shippingPhonenumber,
                  ),
                ),
              ],
            ),
          ),
          new Flexible(
            child: new Container(
              padding: new EdgeInsets.all(5.0),
              // decoration: new BoxDecoration(color: Colors.blue),
              child: shippingStreet,
            ),
          ),
          new Expanded(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Flexible(
                  child: new Container(
                    padding: new EdgeInsets.all(5.0),
                    // decoration: new BoxDecoration(color: Colors.purple),
                    child: shippingApartmentUnit,
                  ),
                ),
                new Flexible(
                  child: new Container(
                    padding: new EdgeInsets.all(5.0),
                    // decoration: new BoxDecoration(color: Colors.pink),
                    child: shippingCity,
                  ),
                ),
              ],
            ),
          ),
          new Expanded(
            child: new Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Flexible(
                  child: new Container(
                    padding: new EdgeInsets.all(5.0),
                    // decoration: new BoxDecoration(color: Colors.purple),
                    child: shippingPostalCode,
                  ),
                ),
                new Flexible(
                  child: new Container(
                      padding: new EdgeInsets.only(top: 10.0),
                      // decoration: new BoxDecoration(color: Colors.pink),
                      child: new Center(
                        child: new Text(
                          "United States",
                          style: new TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 15.0),
                        ),
                      )
                    ),
                ),
              ],
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
    // final String customerImageUrl = 'https://www.thefamouspeople.com/profiles/images/kanye-west-2.jpg';
    final height = MediaQuery.of(context).size.height;

    // Main UI
    return new Scaffold(
      appBar: new AppBar(title: new Text('BUY')),
      body: new ListView(
        children: <Widget>[
          new Container(
            // height: height * 0.4,
            // height: MediaQuery.of(context).size.width * 0.82,
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
          creditInfoContainer(),
          shippingInfoContainer(),
          new Container(
            padding: new EdgeInsets.only(top: 20.0),
            child: new Center(
              child: CircleAvatar(
                child: new Icon(Icons.check),
                radius: 30.0,
              )
            ),
          )
        ],
      ),
    );
  }
}
