import 'package:flutter/material.dart';
import 'package:zapato/shoe.dart';
import 'package:zapato/shoeCard.dart';

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
    return new Scaffold(
        appBar: new AppBar(
          title: new Text('${widget.myShoe.name}'),
        ),
        body: 
  }
}
