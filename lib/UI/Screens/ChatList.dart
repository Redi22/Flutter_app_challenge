import 'package:flutter/material.dart';
import 'package:flutterappchallenge/Core/Models/User_model.dart';
import 'package:flutterappchallenge/UI/Screens/Chat.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => _ChatListState();
}

class _ChatListState extends State<ChatList> {
  User user;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: <Widget>[
          InkWell(
            onTap: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (_) => Chat(user: user)));
            },
            child: ListTile(
                leading: CircleAvatar(
                  child: Text("$user.username[0]"),
                ),
                title: Text("$user.username")),
          )
        ],
      ),
    ));
  }
}
