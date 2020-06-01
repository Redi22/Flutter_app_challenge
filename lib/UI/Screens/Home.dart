import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatelessWidget {
  final String username;
  final String userId;

  const Home({Key key, this.username, this.userId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 65.0 , vertical: 70.0 ),
              child: Image.asset("Assets/Images/heart icon.png",
                  width: 100, height: 90, fit: BoxFit.fitHeight),
            ),
Text("choose anyone" , style: TextStyle(color: Colors.black54),),
            Text("Welcome, you are a?" ,style: TextStyle(fontWeight: FontWeight.bold , fontSize: 26.0)),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 30.0),
              child: Row(
                children: <Widget>[
                  Container(

                    child: Column(
                      children: <Widget>[

                          Padding(
                            padding: const EdgeInsets.only(bottom: 16.0),
                            child: CircleAvatar(
                              radius: 80.0,
                              backgroundColor: Color(0xff02DB96),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.white,
                              ),
                            ),
                          ),

                        Text("Donator", style: TextStyle(fontWeight: FontWeight.bold)),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "You will be donating food for the needy", textAlign: TextAlign.center, style: TextStyle(

                          ),
                          ),
                        )
                      ],
                    ),
                    width: 200,
                    height: 350,
                  ),

                     Container(
                       child: Column(
                         children: <Widget>[
                           Padding(
                             padding: const EdgeInsets.only(bottom: 16.0),
                             child: CircleAvatar(
                              radius: 80.0,
                              backgroundColor: Color(0xff02DB96),
                              child: CircleAvatar(
                                radius: 78.0,
                                backgroundColor: Colors.white,
                                child: Icon(
                                  Icons.favorite_border,
                                  color:  Color(0xff02DB96),
                                ),
                              ),
                    ),
                           ),
                           Text("NGO Volunteer", style: TextStyle(fontWeight: FontWeight.bold),),
                           Padding(
                             padding: const EdgeInsets.all(10.0),
                             child: Text(
                                 "You will pick up and deliver food", textAlign: TextAlign.center,
                             ),
                           )
                         ],
                       ),
                       width: 190,
                       height: 350,
                     ),
                ],
              ),
            )

          ],
        ),
      ),
    );
  }
}
