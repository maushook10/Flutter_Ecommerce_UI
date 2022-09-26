import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// My Own Import
import 'package:ecommerce_flutter_ui/pages/product/all_rating.dart';
import 'package:ecommerce_flutter_ui/Animation/slide_left_rout.dart';

class RatingRow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Material(
            borderRadius: BorderRadius.circular(20.0),
            shadowColor: Colors.grey[300],
            color: Colors.redAccent,
            borderOnForeground: false,
            elevation: 5.0,
            child: InkWell(
              onTap: () {
                Navigator.push(context, SlideLeftRoute(page: AllRating()));
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "4.3",
                      style: TextStyle(color: Colors.white),
                    ),
                    SizedBox(
                      width: 3.0,
                    ),
                    Icon(
                      FontAwesomeIcons.solidStar,
                      size: 13.0,
                      color: Colors.white,
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            width: 8.0,
          ),
          InkWell(
            child: Text(
              '2814 ratings',
              style: TextStyle(color: Colors.grey[600], fontSize: 14.0),
            ),
            onTap: () {
              Navigator.push(context, SlideLeftRoute(page: AllRating()));
            },
          ),
        ],
      ),
    );
  }
}
