import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutterappchallenge/UI/Widgets/LocationViewer.dart';

class PickupDetail extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 3,
            blurRadius: 3,
            // changes position of shadow
          ),
        ],
      ),
      child: Column(
        children: <Widget>[
          LocationViewer(),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 30.0, horizontal: 20.0),
            child: Container(
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("pickup alloted"),
                      Spacer(),
                      Text("Alloted at 2:34pm")
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      CircleAvatar(
                        backgroundColor: Colors.grey,
                        radius: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("someone someone"),
                            Text("23 sucessful pickups"),
                            RatingBar(
                              initialRating: 3,
                              minRating: 1,
                              itemSize: 25,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemPadding: EdgeInsets.only(right: 3.0),
                              itemBuilder: (context, _) => Icon(
                                Icons.star,
                                color: Colors.amber,
                              ),
                              onRatingUpdate: (rating) {
                                print(rating);
                              },
                            ),
                          ],
                        ),
                      ),
                      Spacer(),
                      CircleAvatar(
                        backgroundColor: Color(0xff02DB96),
                        child: IconButton(
                          icon: Icon(Icons.call, color: Colors.white),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.orangeAccent,
                          child: IconButton(
                            icon: Icon(
                              Icons.message,
                              size: 20,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
