import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutterappchallenge/Core/Models/Message_model.dart';
import 'package:flutterappchallenge/Core/Models/User_model.dart';

class Chat extends StatefulWidget {
  final String username;
  final String userId;
  final String chatId;
  final User user;

  const Chat({Key key, this.username, this.userId, this.user, this.chatId})
      : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  static const String chats_ref = "chats";
  final firestore = Firestore.instance;
  final FirebaseAuth _auth = FirebaseAuth.instance;

  CollectionReference get chatsCollection => firestore.collection(chats_ref);
  TextEditingController _controller = TextEditingController();

  final rand = Random();
  final String username = "Rediet";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff02DB96),
        title: Text(username),
      ),
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
            child: StreamBuilder<List<Message>>(
              stream: getMessages(),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                print(snapshot.data);
                if (!snapshot.hasData)
                  return Center(child: CircularProgressIndicator());
                return builder(snapshot.data);
              },
            ),
          ),
          _bottomBar(context),
        ],
      )),
    );
  }

  Row _bottomBar(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: TextField(
                textInputAction: TextInputAction.send,
                controller: _controller,
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(
                      vertical: 10.0,
                      horizontal: 15.0,
                    ),
                    suffixIcon: IconButton(
                      onPressed: () => _save(),
                      icon: Icon(Icons.send),
                    ),
                    prefixIcon: IconButton(
                      onPressed: () => _save(),
                      icon: Icon(Icons.attach_file),
                    ),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    hintText: "Type message ")),
          ),
        ),
      ],
    );
  }

  Widget builder(List<Message> messages) {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      separatorBuilder: (context, index) {
        return const SizedBox(height: 13.0);
      },
      reverse: true,
      itemCount: messages.length,
      itemBuilder: (BuildContext context, int index) {
        Message message = messages[index];
        if (message.userId == widget.userId)
          return _buildMessageRow(message, current: true);
        return _buildMessageRow(message, current: false);
      },
    );
  }

  Row _buildMessageRow(Message message, {bool current}) {
    return Row(
      mainAxisAlignment:
          current ? MainAxisAlignment.start : MainAxisAlignment.end,
      crossAxisAlignment:
          current ? CrossAxisAlignment.start : CrossAxisAlignment.end,
      children: <Widget>[
        SizedBox(width: current ? 30.0 : 20.0),
        Container(
          padding: const EdgeInsets.symmetric(
            vertical: 7.0,
            horizontal: 25.0,
          ),
          decoration: BoxDecoration(
              color:
                  current ? Theme.of(context).primaryColor : Colors.redAccent,
              borderRadius: current
                  ? BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                      bottomRight: Radius.circular(50.0))
                  : BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0),
                      bottomLeft: Radius.circular(50.0))),
          child: Text(
            message.detail,
            style: TextStyle(
                color: current ? Colors.white : Colors.black, fontSize: 14.0),
          ),
        )
      ],
    );
  }

  _save() async {
    if (_controller.text.isEmpty) return;
    FocusScope.of(context).requestFocus(FocusNode());
    Message message =
        Message(unread: true, detail: _controller.text, userId: widget.userId);
    await chatsCollection.document().setData(message.toMap());
    _controller.clear();
  }

  Stream<List<Message>> getMessages() {
    return chatsCollection
        .orderBy("time", descending: true)
        .snapshots()
        .map(mapToMessages);
  }

  List<Message> mapToMessages(QuerySnapshot snapshot) {
    try {
      return snapshot.documents.map<Message>((doc) {
        print(doc);
        return Message.fromMap(doc.data);
      }).toList();
    } catch (e) {
      print(e);
      return <Message>[];
    }
  }
}
