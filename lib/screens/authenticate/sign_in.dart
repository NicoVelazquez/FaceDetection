import 'package:facedetection/services/auth.dart';
import 'package:facedetection/shared/constants.dart';
import 'package:facedetection/shared/loading.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();

  final _formKey = GlobalKey<FormState>();
  String email = '';
  String password = '';
  String error = '';

  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return loading
        ? Loading()
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              centerTitle: true,
              title: Text('Sign In', style: TextStyle(color: Colors.black)),
              elevation: 0,
              bottom: PreferredSize(child: Container(color: Colors.grey[400], height: 1)),
            ),
            body: Container(
              padding: EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        validator: validateEmail,
                        onChanged: (val) {
                          setState(() => email = val);
                        },
                        decoration: textInputDecoration.copyWith(hintText: 'Email')),
                    SizedBox(height: 20.0),
                    TextFormField(
                        validator: (val) => val.length < 6
                            ? 'Password must contain at least 6 caracters'
                            : null,
                        onChanged: (val) {
                          setState(() => password = val);
                        },
                        obscureText: true,
                        decoration: textInputDecoration.copyWith(hintText: 'Password')),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(error, style: TextStyle(color: Colors.red)),
                    ),
                    SizedBox(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () async {
                          if (_formKey.currentState.validate()) {
                            setState(() => loading = true);
                            dynamic result = await _auth.signInEmailAndPassword(email, password);
                            if (result == null) {
                              setState(() {
                                error = 'Incorrect email or password';
                                loading = false;
                              });
                            } else {
                              Navigator.pop(context);
                            }
                          }
                        },
                        child: Text('Continue'),
                        color: Colors.green,
                        splashColor: Colors.green[600],
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        shape: RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(18.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
  }
}

String validateEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  if (!regex.hasMatch(value))
    return 'Enter a valid email.';
  else
    return null;
}
