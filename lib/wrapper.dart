import 'package:facedetection/screens/authenticate/authenticate.dart';
import 'package:facedetection/screens/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


import 'models/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userId = Provider.of<UserId>(context);

    return userId != null ? Home() : Authenticate();
  }
}
