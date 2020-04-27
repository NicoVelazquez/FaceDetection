import 'package:flutter/material.dart';

class LoadingDialog {
  static Future<void> showLoadingDialog(BuildContext context, GlobalKey key, String message) async {
    return showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new WillPopScope(
              onWillPop: () async => false,
              child: SimpleDialog(key: key, backgroundColor: Colors.black54, children: <Widget>[
                Center(
                  child: Column(children: [
                    CircularProgressIndicator(),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      message,
                      style: TextStyle(color: Colors.blueAccent),
                    )
                  ]),
                )
              ]));
        });
  }
}
