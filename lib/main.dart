import 'package:firebase/firebase.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:overlay_sample/page2_view.dart';

GlobalKey<_MyHomePageState> rootKey = GlobalKey<_MyHomePageState>();

void main() {

  initializeApp(

  );

  runApp(MyApp(key: rootKey));
}

class MyApp extends StatelessWidget {
  MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Navigatorを使って画面遷移します。\nオーバーレイしているWidgetは再描画されません。',
            ),
            SizedBox.fromSize(
              size: Size.fromHeight(30.0),
            ),
            FlatButton(
                child: Text(
                  "オーバーレイ",
                  style: TextStyle(color: Colors.white),
                ),
                height: 50,
                minWidth: 200,
                color: Colors.black54,
                onPressed: () {
                  OverlayExample().showOverlay(context);
                }),
            SizedBox.fromSize(
              size: Size.fromHeight(30.0),
            ),
            FlatButton(
                child: Text(
                  "画面遷移",
                  style: TextStyle(color: Colors.white),
                ),
                height: 50,
                minWidth: 200,
                color: Colors.black54,
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return Page2View();
                    }),
                  );
                }),
          ],
        ),
      ),
    );
  }
}

class OverlayExample {
  showOverlay(BuildContext context) async {
    OverlayState overlayState = Overlay.of(context);
    OverlayEntry overlayEntry = OverlayEntry(
        builder: (context) => Positioned(
            top: 100.0,
            right: 30.0,
            child: SizedBox(
              width: 300,
              height: 200,
              child: Card(
                color: Colors.black12,
                child: Text("オーバーレイしているWidget"),
              ),
            )));

    overlayState.insert(overlayEntry);

    await Future.delayed(Duration(seconds: 5));

    overlayEntry.remove();
  }
}
