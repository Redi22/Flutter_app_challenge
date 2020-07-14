import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterappchallenge/Core/Models/User_model.dart';
import 'package:flutterappchallenge/Core/services/firebase_auth_service.dart';
import 'package:flutterappchallenge/UI/Screens/Home.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  static const String id = "SIGNIN";
  static final String path = "lib/UI/Screens/SignIn.dart";

  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  String _email, _password;

  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey,
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 40.0),
              child: Image.asset("Assets/Images/heart icon.png",
                  width: 100, height: 130, fit: BoxFit.fitHeight),
            ),
            Stack(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      top: 130.0, left: 20.0, right: 20.0),
                  child: Card(
                    elevation: 3.0,
                    child: Column(
                      children: <Widget>[
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 30.0,
                          ),
                          child: TextFormField(
                            onSaved: (input) => _email = input,
                            validator: (input) {
                              if (input.isEmpty) {
                                return "Please provide an email";
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              hintText: "Username",
                              prefixIcon: Icon(
                                Icons.person,
                                color: Color(0xff02DB96),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, bottom: 55.0),
                          child: TextFormField(
                            validator: (input) {
                              if (input.length < 8) {
                                return " Password must be more than 8 characters";
                              }
                              return null;
                            },
                            onSaved: (input) => _password = input,
                            decoration: InputDecoration(
                              hintText: "Password",
                              prefixIcon: Icon(
                                Icons.lock,
                                color: Color(0xff02DB96),
                              ),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 15),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 328.0),
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: new EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff02DB96),
                        child: FlatButton(
                            onPressed: () {
                              signIn();
                            },
                            child: Text(
                              "Sign In",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ))),
                  ),
                ),
                Positioned(
                  top: 100,
                  left: 100,
                  right: 100,
                  child: CircleAvatar(
                    backgroundColor: Color(0xff02DB96),
                    radius: 35,
                    child: Icon(
                      Icons.person,
                      color: Colors.white,
                      size: 40.0,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 50,
            ),
            Center(
                child: InkWell(
              onTap: () {},
              child: Text("Forgot Password?"),
            )),
          ],
        ),
      ),
    );
  }

  Future<void> signIn() async {
    final formState = _formKey.currentState;
    final auth = Provider.of<FirebaseAuthService>(context, listen: false);

    if (formState.validate()) {
      formState.save();
      print(_email);
      try {
        final User user =
            await auth.signInEmailAndPassword(_email?.trim(), _password);
        print(user.username);
        Navigator.of(context).push(MaterialPageRoute(
            builder: (_) => Home(
                  username: user.email,
                  userId: user.userId,
                )));
      } catch (e) {
        print(e.message);
      }
    }
  }
}
