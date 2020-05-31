import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterappchallenge/UI/Screens/Home.dart';

class SignUp extends StatefulWidget {
  static const String id = "SIGNIN";
  static final String path = "lib/UI/Screens/SignIn.dart";

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  String _email, _password, _phone, verificationId, smsCode;

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
                      top: 100.0, left: 20.0, right: 20.0),
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
                              left: 30.0, right: 30.0, bottom: 30.0),
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
                        Padding(
                          padding: EdgeInsets.only(
                              left: 30.0, right: 30.0, bottom: 55.0),
                          child: TextFormField(
                            validator: (input) {
                              if (input.isEmpty) {
                                return " Phone is required";
                              }
                              return null;
                            },
                            onChanged: (input) => _phone = input,
                            decoration: InputDecoration(
                              hintText: "Phone",
                              prefixIcon: Icon(
                                Icons.phone_android,
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
                  padding: const EdgeInsets.only(top: 380.0),
                  child: Container(
                    alignment: Alignment.topCenter,
                    padding: new EdgeInsets.only(right: 20.0, left: 20.0),
                    child: Material(
                        elevation: 2.0,
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: Color(0xff02DB96),
                        child: FlatButton(
                            onPressed: () {
                              signUp();
                            },
                            child: Text(
                              "Sign Up",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 18),
                            ))),
                  ),
                ),
                Positioned(
                  top: 70,
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


  signInFinish() async{
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId,
        smsCode: smsCode,
      );
      final FirebaseUser user = (await _auth.signInWithCredential(credential)) as FirebaseUser;
      final FirebaseUser currentUser = await _auth.currentUser();
      assert(user.uid == currentUser.uid);
      Navigator.of(context).pop();
      Navigator.of(context).pushReplacementNamed('/home');
    } catch (e) {
      print(e);
    }
  }

    Future<void> signUp() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrive = (String verId) {
      this.verificationId = verId;
    };



    final PhoneVerificationCompleted verificationCompleted = (AuthCredential credential) {
      print("ver");
    };
    final PhoneVerificationFailed verificationFailed = (AuthException exc) {
      print('${exc.message}');
    };
    Future<bool> smsCodeDialog(BuildContext context) {
      return showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return new AlertDialog(
              title: Text("Add Code"),
              content: TextField(
                  onChanged: (value){
                    this.smsCode = value;
                  }
              ),
              contentPadding: EdgeInsets.all(10.0),
              actions: <Widget>[
                new FlatButton(
                  child: Text("Finish"),
                  onPressed: (){
                    FirebaseAuth.instance.currentUser().then((user){
                      if(user != null){
                        Navigator.of(context).pop();
                        Navigator.of(context).pushReplacementNamed('/home');
                      }else{
                        Navigator.of(context).pop();
                        signInFinish();

                      }
                    });
                  },
                )
              ],
            );
          }
      );
    }
    final PhoneCodeSent codeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialog(context);
    };
    FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: this._phone,
        timeout: const Duration(seconds: 20),
        verificationCompleted: verificationCompleted,
        verificationFailed: verificationFailed,
        codeSent: codeSent,
        codeAutoRetrievalTimeout: autoRetrive);
  }
}



class FirstWaveCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 75);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 100);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 60);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class ThirdWaveCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.6, size.height - 65);
    var firstControlPoint = Offset(size.width * 0.25, size.height - 100);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 40);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}

class SecondWaveCliper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.lineTo(0.0, size.height - 50);

    var firstEndPoint = Offset(size.width * 0.7, size.height - 40);
    var firstControlPoint = Offset(size.width * 0.25, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    var secondEndPoint = Offset(size.width, size.height - 45);
    var secondControlPoint = Offset(size.width * 0.84, size.height - 50);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
