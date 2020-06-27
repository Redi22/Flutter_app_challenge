import 'package:flutter/material.dart';
import 'package:flutterappchallenge/UI/Widgets/CustomPhotoViewer.dart';

class LocationViewer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10),
            bottomRight: Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            // changes position of shadow
          ),
        ],
      ),
      height: 150,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "4 Breads with ketchup",
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 17),
                        ),
                        Container(
                            child: Text(
                                "the description of the food is this aa?",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    color: Colors.black45, fontSize: 13))),
                        Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Container(
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.place, size: 15),
                                        Text(
                                          "Addis Ababa, Ethiopia",
                                          style: TextStyle(
                                              fontSize: 11,
                                              color: Colors.black87),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Row(
                                      children: <Widget>[
                                        Icon(Icons.schedule, size: 15),
                                        Text(
                                          "4:00pm - 3:00am , 23rd June, 2020",
                                          style: TextStyle(
                                            color: Colors.black87,
                                            fontSize: 11,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      CustomPhotoViewer(
                        image: 'Assets/Images/guitar.jpg',
                        height: 100,
                        width: 80,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 8.0),
                        child: Container(
                          height: 20.0,
                          width: 85,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15.0))),
                          child: Center(
                            child: Text(
                              "1 day left",
                              style:
                                  TextStyle(fontSize: 11, color: Colors.white),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
