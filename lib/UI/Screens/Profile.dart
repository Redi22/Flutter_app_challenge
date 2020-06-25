import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappchallenge/UI/Widgets/CustomPhotoViewer.dart';
import 'package:flutterappchallenge/UI/Widgets/Donation.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          child: Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Text("Profile" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 20.0),),
              ) ,
              Padding(
                padding: const EdgeInsets.symmetric(vertical:28.0 , horizontal: 20),
                child: Container(
                  child: Row(
                    children: <Widget>[
                      CustomPhotoViewer(image: 'Assets/Images/guitar.jpg' , height:  200, width: 150,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text("Dean Norman" , style: TextStyle(color:Color(0xff02DB96) , fontSize: 22 ),),
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Text("Student", style: TextStyle(color:Colors.black38 , fontSize: 13 )),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top:8.0),
                              child: Text("Addis Ababa , Ethiopia" , style: TextStyle(color:Colors.black38 , fontSize: 13 )),
                            ),
                            Card(
                              elevation: 4.0,
                              child: Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text("Golden Trophy" , style: TextStyle(fontWeight: FontWeight.bold),),
                                         Padding(
                                           padding: const EdgeInsets.only(top:8.0),
                                           child: Container(
                                             width:120,
                                             height: 4.0,
                                             child: LinearProgressIndicator(
                        backgroundColor:  Color(0x3302DB96),
                        valueColor:  AlwaysStoppedAnimation<Color>(Color(0xff02DB96)),
                        value: 0.4,
                    ),
                                           ),
                                         ),

                                      ],
                                    ),
                                  ),
          Image.asset('Assets/Images/trophy.jpg' , fit: BoxFit.fill, height: 60, width:60,)
                                ],
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
               Padding(
                 padding: const EdgeInsets.all(10.0),
                 child: Text("Hello This is my bio and i like donating stuff mnamn mnamn Flex." , style: TextStyle(color: Colors.black38),),
               ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 8.0),
                child: Row(
                  children: <Widget>[
                    Text("Your Donations" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18),),
                    Spacer(),
                    Text("2", style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18)),

                  ],
                ),

              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10.0),
                child: Donation(),
              ),  Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0 , vertical: 10.0),
                child: Donation(),
              )

            ],
          ),
        ),
      ),
    );
  }
}
