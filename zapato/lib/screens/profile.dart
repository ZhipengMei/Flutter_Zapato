import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zapato/shoeCard.dart';
import 'package:zapato/shoe.dart';
import 'home.dart';
import 'package:zapato/userFeedbacks.dart';
import 'package:cached_network_image/cached_network_image.dart';

Image myAvatar;

List<Shoe> shoesList = new List<Shoe>();
List<UserFeedback> feedbackList = new List<UserFeedback>();

class Profile extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new ProfileState();
  }
}

class ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  String _imageUrl, _uid, _username, _email;

  Future<Null> callSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      _imageUrl = prefs.getString('photoUrl');
      _uid = prefs.getString('uid');
      _username = prefs.getString('username');
      _email = prefs.getString('email');
    });
  }

  @override
  void initState() {
    super.initState();
    _uid = '';
    _username = '';
    _email = '';
    _imageUrl =
        "https://visualpharm.com/assets/336/User-595b40b65ba036ed117d26d4.svg"; //placeholder profile icon
    callSharedPreferences();

    setState(() {
      shoesList = HomeState().getShoesList();

      feedbackList.clear();
      UserFeedback feedback1 = new UserFeedback();
      feedback1.name = 'YeezyBuyer2';
      feedback1.comment =
          'Great seller, fast shippinig! Really knows his Yeezys. This guy is crazy for Kayne.';

      UserFeedback feedback2 = new UserFeedback();
      feedback2.name = 'YeezyHimself88';
      feedback2.comment =
          'Overpriced, but I got my Yeezys fast. He doesnt\'t as much as I do about Kanye.';

      feedbackList.add(feedback1);
      feedbackList.add(feedback2);
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //************************
    //Profile image section
    //************************
    final profileView = new Container(
      padding: new EdgeInsets.all(8.0),
      // width: 400.0,
      height: 136.0,
      child: new Row(children: [
        // Red Bar
        // This will take up 50dp always, since it is not wrapped by a Expanded
        new Container(
          padding: new EdgeInsets.all(5.0),
          width: 120.0,
          // decoration: new BoxDecoration(color: Colors.red[500]),
          child: new CircleAvatar(
            radius: 60.0,
            backgroundImage: new CachedNetworkImageProvider(_imageUrl),
          ),
        ),
        //end of profile iamge
        // Green Bar
        // This will take up 1/3 of the remaining space (1/3 of 350dp)
        new Expanded(
          flex: 1,
          child: new Container(
            padding: new EdgeInsets.all(3.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                new Container(
                  height: 40.0,
                  // decoration: new BoxDecoration(color: Colors.orange),
                  child: new Text("YeezyLord92",
                      style: new TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                          fontFamily: 'Nunito')),
                ),
                new Expanded(
                  flex: 1,                  
                  child: new Container(
                    // decoration: new BoxDecoration(color: Colors.green),
                    //   child: new Text(
                    // "Rating: 5920",
                    // style: new TextStyle(fontFamily: 'Nunito', fontSize: 16.0),
                    // )
                    alignment: Alignment.topLeft,
                    child: new StarRating(
                      rating: 4.5,
                      mainAlignment: MainAxisAlignment.end,
                      onRatingChanged: (rating, mainAlignment) => rating,
                    ),
                  ),
                ),
                new Expanded(
                  flex: 2,
                  child: new Container(
                    alignment: Alignment.bottomCenter,
                    // decoration: new BoxDecoration(color: Colors.purple),
                    child: new Text(
                      "I've been collecting cool hype shoes since the beginning of time.",
                      style: new TextStyle(
                        fontFamily: 'Nunito',
                        fontSize: 13.0,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        // Blue Bar
        // This will take up 2/3 of the remaining space (2/3 of 350dp)
        // new Expanded(
        //   flex: 2,
        //   child: new Container(
        //       decoration: new BoxDecoration(
        //     color: Colors.blue[500],
        //   )),
        // )
      ]),
    );
    //end profileView

    //************************
    //Current Listing Section
    //************************
    final currentListingText = new Container(
      padding: new EdgeInsets.all(5.0),
      alignment: Alignment.centerLeft,
      child: new Text(
        'Current Listings',
        style: new TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
      ),
    );

    final currentListingShoe = new Container(
        height: 200.0,
        decoration: new BoxDecoration(color: Colors.white70),
        padding: new EdgeInsets.all(15.0),
        child: new GridView.count(
            scrollDirection: Axis.horizontal,
            primary: true,
            padding: EdgeInsets.all(1.0),
            crossAxisCount: 1,
            childAspectRatio: 1.0,
            mainAxisSpacing: 1.0,
            crossAxisSpacing: 1.0,
            children: shoesList.map((Shoe shoe) {
              return TheGridView().makeGridView(shoe);
            }).toList()));

    // //************************
    // //Feedback Listing Section
    // //************************
    final feedbakText = new Container(
      padding: new EdgeInsets.all(5.0),
      alignment: Alignment.centerLeft,
      child: new Text(
        'Feedbacks',
        style: new TextStyle(fontSize: 17.0, fontWeight: FontWeight.w500),
      ),
    );

    //main UI
    return new Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        profileView, //section 1
        new Divider(height: 15.0),
        new Expanded(
            //section 2
            child: new ListView(
          children: <Widget>[
            currentListingText,
            currentListingShoe,
            feedbakText,
            // feedbakComment,
            TheFeedback().feedbakComment(
                feedbackList[0].name.toString(),
                feedbackList[0].comment.toString(),
                5.0,
                'https://res.cloudinary.com/campus-job/image/upload/t_student-public-page/v1/profile_pictures/YNM5evhNyO_20160909.jpg'),
            TheFeedback().feedbakComment(
                feedbackList[1].name.toString(),
                feedbackList[1].comment.toString(),
                2.5,
                'https://www.thefamouspeople.com/profiles/images/kanye-west-2.jpg'),
          ],
        ))
      ],
    );
  }
}

class TheFeedback {
  Row feedbakComment(
      String name, String comment, double rating, String customerImageUrl) {
    return new Row(
      children: <Widget>[
        new Container(
          padding: new EdgeInsets.all(14.0),
          child: new CircleAvatar(
            radius: 30.0,
            backgroundImage: new CachedNetworkImageProvider(customerImageUrl),
          ),
        ),
        new Container(
          child: new Flexible(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Text(
                  name,
                  style: new TextStyle(fontWeight: FontWeight.bold),
                ),
                new Text(comment, softWrap: true, textAlign: TextAlign.start),
                new StarRating(
                  rating: rating,
                  mainAlignment: MainAxisAlignment.start,
                  onRatingChanged: (rating, mainAlignment) => rating,
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

typedef void RatingChangeCallback(double rating, MainAxisAlignment mainAlignment);

class StarRating extends StatelessWidget {
  final int starCount;
  final double rating;
  final RatingChangeCallback onRatingChanged;
  final Color color;
  final MainAxisAlignment mainAlignment;

  StarRating(
      {this.starCount = 5, this.rating = .0, this.onRatingChanged, this.color, this.mainAlignment});

  Widget buildStar(BuildContext context, int index) {    
    Icon icon;
    if (index >= rating) {
      icon = new Icon(
        Icons.star_border,
        color: Theme.of(context).buttonColor,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = new Icon(
        Icons.star_half,
        color: color ?? Theme.of(context).primaryColor,
      );
    } else {
      icon = new Icon(
        Icons.star,
        color: color ?? Theme.of(context).primaryColor,
      );
    }
    return new InkResponse(
      onTap:
          onRatingChanged == null ? null : () => onRatingChanged(index + 1.0, mainAlignment),
      child: icon,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Row(
      mainAxisAlignment: mainAlignment,
        children:
          new List.generate(starCount, (index) => buildStar(context, index)));
  }
}
