import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutterappchallenge/Core/Models/User_model.dart';
import 'package:flutterappchallenge/Core/services/firebase_auth_service.dart';
import 'package:flutterappchallenge/UI/Screens/Home.dart';
import 'package:flutterappchallenge/UI/Screens/SignIn.dart';
import 'package:provider/provider.dart';

class RootPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final auth = Provider.of<FirebaseAuthService>(context, listen: false);
    return StreamBuilder<User>(
        stream: auth.onAuthStateChanged,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.active) {
            User user = snapshot.data;
            return user != null ? Home() : SignIn();
          }
          return Center(child: CircularProgressIndicator());
        });
  }
}
