import 'package:flutter/material.dart';

class ConnectHeader extends StatefulWidget {
  final GestureTapCallback onPressedReturn;
  String text = "";

  ConnectHeader({Key key, this.onPressedReturn, this.text}) : super(key: key);

  @override
  _ConnectHeaderState createState() => _ConnectHeaderState();
}

class _ConnectHeaderState extends State<ConnectHeader> {

  @override
  Widget build(BuildContext context) {

    final _return = Container(
//      color: Colors.cyan,
//      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 10.0),
      child: IconButton(
        icon: Icon(Icons.chevron_left, color: Colors.white),
        iconSize: 40.0,
        onPressed: () {
          widget.onPressedReturn();
        },
      ),
    );

    final txt = Container(
      child: new Text('Хүүхэд холбох хүсэлт',
        style: TextStyle(
          fontSize: 18.0,
          fontFamily: 'Roboto',
          color: Colors.white,
        ),
      ),
    );
   

    return new Container(
      child: Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.2,
          decoration: new BoxDecoration(
            boxShadow: [new BoxShadow(
              color: Colors.black,
              blurRadius: 40.0,
            )],
            gradient: LinearGradient(
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.topRight,
                colors: [
                  Color(0xff1983F3),
                  Color(0xff6137F1),
                ],
              stops: [
                0.0,
                1.0,
              ]
            ),

          ),
          child: new Container(
            child: new Flex(
              direction: Axis.horizontal,
              children: <Widget>[
               _return,
                txt,
              ],
            ),
          ),
        ),
      ),
    );



  }
}
