import 'package:flutter/material.dart';

class CardChild extends StatefulWidget {
  String text = "";
  GestureTapCallback onClick;
  CardChild({Key key, this.text, this.onClick}) : super(key: key);

  @override
  _CardChildState createState() => _CardChildState();
}

class _CardChildState extends State<CardChild> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 65.0,
      child: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
        child: Card(
          elevation: 4.0,
          child: new Row(
            children: [
              new CircleAvatar(
                backgroundImage: new AssetImage('images/ic_male.png'),
                radius: 100.0,
              ),
              new Text(
                widget.text,
                style: TextStyle(
                  fontSize: 14.0,
                  fontWeight: FontWeight.w300,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

