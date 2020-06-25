import 'package:cloud_firestore/cloud_firestore.dart';

class Message {
  final String detail;
  final bool unread;
  final String userId;
  final DateTime time;
  final String channelId;

  Message({this.time, this.unread, this.channelId, this.detail, this.userId});

  Message.fromMap(Map<String, dynamic> data)
      : time = (data["time"] as Timestamp)?.toDate(),
        unread = data["unread"],
        channelId = data["channelId"],
        detail = data["detail"],
        userId = data["userId"];

  toMap() => <String, dynamic>{
        "unread": true,
        "detail": detail,
        "time": Timestamp.now(),
        "id": channelId,
        "userId": userId,
      };
}
