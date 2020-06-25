import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappchallenge/UI/Widgets/RangeSelector.dart';

 enum dates{Today , Tomorrow , DayAfter}
class Home extends StatelessWidget {
  final String username;
  final String userId;

  const Home({Key key, this.username, this.userId}) : super(key: key);

  @override


  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(child: Text("post donations" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 18 ),)),
                ),
                 Row(
                   children: <Widget>[
                     Container(
                       height: 40.0,
                       width: 200.0,
                       color: Color(0x2202DB96),
                       child: Padding(
                         padding: const EdgeInsets.all(10.0),
                         child: Text("Pickup: R-36 Mal.." , style: TextStyle(color: Color(0x9902DB96)),),
                       ),
                     ),
                     Spacer(),
                     Padding(
                       padding: const EdgeInsets.all(10.0),
                       child: InkWell(
                         onTap: (){},
                         child: Text("CHANGE" , style: TextStyle(fontSize: 14),),
                       ),
                     )
                   ],
                 ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:4.0),
                  child: TextField(
                    onChanged: (value) => {
                      print(value)
                    },
                    decoration: InputDecoration(
                        labelText: "Food Name",

                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:4.0),
                  child: TextField(
                    onChanged: (value) => {
                      print(value)
                    },
                    decoration: InputDecoration(
                        labelText: "Donate where?",
                        prefix: Text("Give to:")
                    ),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.only(top: 12.0),


        ),
        ])
    ))));
  }
}
