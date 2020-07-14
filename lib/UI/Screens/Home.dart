import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterappchallenge/Core/Models/Donation_model.dart';
import 'package:flutterappchallenge/UI/Widgets/Donation.dart';
import 'package:flutterappchallenge/UI/Widgets/RangeSelector.dart';

var firestore = Firestore.instance;
CollectionReference get DonationCollections =>
    firestore.collection("Donations");

class Home extends StatefulWidget {
  final String username;
  final String userId;

  const Home({Key key, this.username, this.userId}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Expanded(
      child: StreamBuilder<List<DonationModel>>(
        stream: getMessages(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          print(snapshot.data);
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());
          return Donation(data: snapshot.data);
        },
      ),
    )));
  }
}

Stream<List<DonationModel>> getMessages() {
  return DonationCollections.orderBy("time", descending: true)
      .snapshots()
      .map(mapToDonation);
}

List<DonationModel> mapToDonation(QuerySnapshot snapshot) {
  try {
    return snapshot.documents.map<DonationModel>((doc) {
      return DonationModel.fromMap(doc.data);
    }).toList();
  } catch (e) {
    print(e);
    return <DonationModel>[];
  }
}
