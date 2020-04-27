import 'package:facedetection/screens/authenticate/sign_in.dart';
import 'package:facedetection/screens/authenticate/sign_up.dart';
import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  void openSignIn() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignIn()),
    );
  }

  void openSignUp() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => SignUp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData = MediaQuery.of(context);

    return Scaffold(
      backgroundColor: Colors.grey,
      body: Column(
        children: <Widget>[
          Container(
            height: queryData.size.height / 5,
            color: Colors.transparent,
            alignment: Alignment.bottomCenter,
            child: Text(
              'Face Detection',
              style: TextStyle(
                color: Colors.white,
                fontSize: queryData.size.height / 13,
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.transparent,
            ),
          ),
          Container(
            height: queryData.size.height / 5,
            color: Colors.transparent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                MaterialButton(
                  onPressed: () {
                    openSignUp();
                  },
                  child: Text('Sign Up'),
                  color: Colors.green,
                  splashColor: Colors.green[600],
                  textColor: Colors.white,
                  disabledColor: Colors.grey,
                  minWidth: queryData.size.width / 2.5,
                  disabledTextColor: Colors.black,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                ),
                MaterialButton(
                  onPressed: () {
                    openSignIn();
                  },
                  child: Text('Sign In'),
                  color: Colors.white,
                  splashColor: Colors.grey[100],
                  textColor: Colors.blue,
                  disabledColor: Colors.grey,
                  disabledTextColor: Colors.black,
                  minWidth: queryData.size.width / 2.5,
                  shape: RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(18.0),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
