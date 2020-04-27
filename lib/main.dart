import 'package:facedetection/services/auth.dart';
import 'package:facedetection/services/database.dart';
import 'package:facedetection/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/user.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<UserId>.value(
      value: AuthService().user,
      child: Builder(builder: (BuildContext context) {
        UserId userId = Provider.of<UserId>(context);
        return StreamProvider<User>.value(
            value: userId != null ? DatabaseService(uid: userId.uid).user : null,
            child: MaterialApp(
              home: Wrapper(),
            ));
      }),
    );
  }
}
