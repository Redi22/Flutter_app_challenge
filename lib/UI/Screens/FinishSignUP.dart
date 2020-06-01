import 'package:flutter/material.dart';

class SignUpFinal extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 40.0),
            child: Image.asset("Assets/Images/heart icon.png",
                width: 60, height: 70, fit: BoxFit.fitHeight),
          ),
        ],
      ),
    );
  }
}
