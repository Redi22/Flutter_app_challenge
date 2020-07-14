import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappchallenge/UI/Widgets/CustomBtn.dart';
import 'package:flutterappchallenge/UI/Widgets/CustomPhotoViewer.dart';
import 'package:flutterappchallenge/UI/Widgets/RangeSelector.dart';

enum dates { Today, Tomorrow, DayAfter }

class PostDonations extends StatefulWidget {
  final String username;
  final String userId;

  const PostDonations({Key key, this.username, this.userId}) : super(key: key);

  @override
  _PostDonationsState createState() => _PostDonationsState();
}

enum date { today, tomorrow, dayAfter }

class _PostDonationsState extends State<PostDonations> {
  date _character = date.today;

  var _radioValue1;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(40.0),
              child: Center(
                  child: Text(
                "post donations",
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
              )),
            ),
            Row(
              children: <Widget>[
                Container(
                  height: 40.0,
                  width: 200.0,
                  color: Color(0x2202DB96),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text(
                      "Pickup: R-36 Mal..",
                      style: TextStyle(color: Color(0x9902DB96)),
                    ),
                  ),
                ),
                Spacer(),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: InkWell(
                    onTap: () {},
                    child: Text(
                      "CHANGE",
                      style: TextStyle(fontSize: 14),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                onChanged: (value) => {print(value)},
                decoration: InputDecoration(
                  labelText: "Food Name",
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: TextField(
                onChanged: (value) => {print(value)},
                decoration: InputDecoration(
                    labelText: "Donate where?", prefix: Text("Give to:")),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Text(
                "Pickup Date",
                style: TextStyle(color: Colors.black38, fontSize: 14),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 5.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Radio(
                    value: 0,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChange1,
                  ),
                  Text(
                    'Today',
                    style: new TextStyle(fontSize: 14.0),
                  ),
                  Radio(
                    value: 1,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChange1,
                  ),
                  Text(
                    'Tomorrow',
                    style: new TextStyle(
                      fontSize: 16.0,
                    ),
                  ),
                  Radio(
                    value: 2,
                    groupValue: _radioValue1,
                    onChanged: _handleRadioValueChange1,
                  ),
                  Text(
                    'Day After',
                    style: new TextStyle(fontSize: 14.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 12.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "Time",
                    style: TextStyle(color: Colors.black38, fontSize: 14),
                  ),
                  // RangeSelector(),
                ],
              ),
            ),
            Text("Add Photo"),
            Row(
              children: <Widget>[
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 150,
                    width: 100,
                    decoration: BoxDecoration(
                      color: Color(0xff02DB96),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                    ),
                    child: Icon(
                      Icons.add,
                      size: 40,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CustomPhotoViewer(
                    image: 'Assets/Images/guitar.jpg',
                    height: 150,
                    width: 100,
                  ),
                ),
                CustomPhotoViewer(
                  image: 'Assets/Images/guitar.jpg',
                  height: 150,
                  width: 100,
                ),
              ],
            ),
            Spacer(),
            Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: CustomBtn(
                buttonName: 'POST',
                function: postDonation,
              ),
            )
          ],
        ),
      ),
    )));
  }

  void _handleRadioValueChange1(value) {
    setState(() {
      _radioValue1 = value;
    });
  }

  void postDonation() {}
}
