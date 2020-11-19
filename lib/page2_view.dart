import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Page2View extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(' 移動した画面'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: FlatButton(
            child: Text(
              "元の画面に戻る",
              style: TextStyle(color: Colors.white),
            ),
            height: 50,
            minWidth: 200,
            color: Colors.black54,
            onPressed:() {
              Navigator.pop(context);
            }
        ),
      )
    );
  }
}