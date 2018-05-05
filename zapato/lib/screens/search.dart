import 'package:flutter/material.dart';
import 'package:zapato/shoe.dart';
import 'home.dart';
import 'product_detail.dart';
import 'package:zapato/shoe.dart';

class SearchList extends StatefulWidget {
  SearchList({Key key}) : super(key: key);
  @override
  _SearchListState createState() => new _SearchListState();
}

class _SearchListState extends State<SearchList> {
  Widget appBarTitle = new Text(
    "",
    style: new TextStyle(color: Colors.white),
  );
  Icon actionIcon = new Icon(
    Icons.search,
    color: Colors.white,
  );
  final key = new GlobalKey<ScaffoldState>();
  final TextEditingController _searchQuery = new TextEditingController();
  bool _isSearching;
  String _searchText = "";
  List<Shoe> shoesList = new List<Shoe>();

  _SearchListState() {
    _searchQuery.addListener(() {
      if (_searchQuery.text.isEmpty) {
        setState(() {
          _isSearching = false;
          _searchText = "";
        });
      } else {
        setState(() {
          _isSearching = true;
          _searchText = _searchQuery.text;
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
    shoesList = HomeState().getShoesList();
    _isSearching = false;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: key,
      appBar: buildBar(context),
      body: new ListView(
        padding: new EdgeInsets.symmetric(vertical: 8.0),
        children: _isSearching ? _buildSearchList() : _buildList(),
      ),
    );
  }

  List<ChildItem> _buildList() {
    return shoesList.map((contact) => new ChildItem(contact)).toList();
  }

  List<ChildItem> _buildSearchList() {
    if (_searchText.isEmpty) {
      return shoesList.map((contact) => new ChildItem(contact)).toList();
    } else {
      List<Shoe> _searchList = List();
      for (int i = 0; i < shoesList.length; i++) {
        Shoe matched_shoe = shoesList[i];
        if (matched_shoe.name.toLowerCase().contains(_searchText.toLowerCase())) {
          _searchList.add(matched_shoe);
        }
      }
      return _searchList.map((contact) => new ChildItem(contact)).toList();
    }
  }

  Widget buildBar(BuildContext context) {
    return new AppBar(centerTitle: true, title: appBarTitle, actions: <Widget>[
      new IconButton(
        icon: actionIcon,
        onPressed: () {
          setState(() {
            if (this.actionIcon.icon == Icons.search) {
              this.actionIcon = new Icon(
                Icons.close,
                color: Colors.white,
              );
              this.appBarTitle = new TextField(
                controller: _searchQuery,
                style: new TextStyle(
                  color: Colors.white,
                ),
                decoration: new InputDecoration(
                    prefixIcon: new Icon(Icons.search, color: Colors.white),
                    hintText: "Search...",
                    hintStyle: new TextStyle(color: Colors.white)),
              );
              _handleSearchStart();
            } else {
              _handleSearchEnd();
            }
          });
        },
      ),
    ]);
  }

  void _handleSearchStart() {
    setState(() {
      _isSearching = true;
    });
  }

  void _handleSearchEnd() {
    setState(() {
      this.actionIcon = new Icon(
        Icons.search,
        color: Colors.white,
      );
      this.appBarTitle = new Text(
        "",
        style: new TextStyle(color: Colors.white),
      );
      _isSearching = false;
      _searchQuery.clear();
    });
  }
}

class ChildItem extends StatelessWidget {
  final Shoe myShoe;
  ChildItem(this.myShoe);
  @override
  Widget build(BuildContext context) {
    return new ListTile(
      title: new Text(this.myShoe.name),
      onTap: () {
        var route = new MaterialPageRoute(builder: (BuildContext context) {
          return new ProductDetail(myShoe: myShoe);
        });
        Navigator.of(context).push(route);
      },
    );
  }
}
