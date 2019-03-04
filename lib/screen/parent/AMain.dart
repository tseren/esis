import 'package:flutter/material.dart';
import 'package:esis/widget/Modal.dart';

class AMain extends StatefulWidget {
  @override
  _AMainState createState() => _AMainState();
}

class _AMainState extends State<AMain> {
  Modal modal = new Modal();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(
          title: new Text("Bottom Modal sheet"),
        ),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text('Body'),
            ],
          ),
        ),

      floatingActionButton: new FloatingActionButton(
          onPressed: () => modal.mainBottomSheet(context),
          child: new Icon(Icons.add) ,
          ),
    );
  }
}
