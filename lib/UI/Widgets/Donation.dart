import 'package:flutter/material.dart';
import 'package:flutterappchallenge/UI/Widgets/CustomPhotoViewer.dart';

class Donation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: CustomPhotoViewer(
                image: 'Assets/Images/guitar.jpg',
                height: 100,
                width: 80,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "4 Breads with ketchup",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                    ),
                    Container(
                        child: Text("the description of the food is this aa?",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                color: Colors.black45, fontSize: 13))),
                    Container(
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: Row(
                          children: <Widget>[
                            Text(
                              "June 28, 2009",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Color(0xff02DB96)),
                            ),
                            SizedBox(
                              width: 60,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Container(
                                color: Color(0x2202DB96),
                                width: 70,
                                height: 30,
                                child: Center(
                                  child: InkWell(
                                    child: Text("SHARE",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            color: Color(0xff02DB96))),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
