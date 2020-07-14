import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterappchallenge/Core/Models/image_reference.dart';
import 'package:geoflutterfire/geoflutterfire.dart';

class DonationModel {
  String title;
  GeoFirePoint from;
  GeoFirePoint to;
  DateTime pickupDate;
  Timestamp pickupTimeStart;
  Timestamp pickupTimeEnd;
  List<ImageReference> images;

  DonationModel.fromMap(Map<String, dynamic> data)
      : title = data["title"],
        from = data["from"],
        to = data["to"],
        pickupDate = data["pickupDate"],
        pickupTimeStart = data["pickupTimeStart"],
        pickupTimeEnd = data["pickupTimeEnd"],
        images = data['images'];

  toMap() => <String, dynamic>{
        "title": title,
        "from": from,
        "to": to,
        "pickupDate": pickupDate,
        "pickupTimeStart": pickupTimeStart,
        "pickupTimeEnd": pickupTimeEnd,
        "images": images
      };
}
