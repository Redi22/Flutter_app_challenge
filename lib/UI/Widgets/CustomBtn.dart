import 'package:flutter/material.dart';

class CustomBtn extends StatelessWidget {
  final String buttonName;
  final Function function;


  const CustomBtn({Key key, this.buttonName, this.function}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: function,
      child: Container(

        decoration: BoxDecoration(
            color: Color(0xff02DB96),
          borderRadius: BorderRadius.all(Radius.circular(8))
        ),
        child: Center(child: Text(buttonName , style: TextStyle(fontSize: 16 , color: Colors.white),)),
        height: 50,
        width: 500,
      ),
    );
  }
}
