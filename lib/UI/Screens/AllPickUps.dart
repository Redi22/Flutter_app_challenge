import 'package:flutter/material.dart';
import 'package:flutterappchallenge/UI/Widgets/CustomPhotoViewer.dart';
import 'package:flutterappchallenge/UI/Widgets/LocationViewer.dart';

class AllPickUps extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Color(0xffe6f2f0),
          body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.only(top: 30.0),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                          child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          "Pick Ups",
                          style: TextStyle(fontSize: 20),
                        ),
                      )),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 30.0),
                        child: TextField(
                          textAlign: TextAlign.center,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            hintText: 'Search',
                            prefixIcon: Icon(Icons.search),
                            hintStyle: TextStyle(fontSize: 16),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30),
                              borderSide: BorderSide(
                                width: 0,
                                style: BorderStyle.none,
                              ),
                            ),
                            filled: true,
                            contentPadding: EdgeInsets.all(16),
                            fillColor: Colors.white,
                          ),
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Text("Unpickedup Packages"),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 15.0),
                            child: Container(
                              height: 20.0,
                              decoration: BoxDecoration(
                                  color: Color(0x9902DB96),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15.0))),
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Center(child: Text("24")),
                              ),
                            ),
                          )
                        ],
                      ),
                      LocationViewer(),
                      LocationViewer(),
                      LocationViewer(),
                      LocationViewer(),
                    ])),
          )),
    );
  }
}
