import 'package:flutter/material.dart';

class ParentHeader extends StatefulWidget {
  final GestureTapCallback onPressedLeft;
  final GestureTapCallback onPressedRight;
  String text = "Name";

  ParentHeader({Key key, this.onPressedLeft, this.onPressedRight, this.text})
      : super(key: key);

  @override
  _ParentHeaderState createState() => _ParentHeaderState();
}

class _ParentHeaderState extends State<ParentHeader> {
  @override
  Widget build(BuildContext context) {
    final leftMenu = Container(
//      color: Colors.cyan,
//      alignment: Alignment.topLeft,
      padding: const EdgeInsets.only(left: 10.0, bottom: 60.0),
      child: IconButton(
        icon: Icon(Icons.chevron_left, size: 30.0, color: Colors.white),
        onPressed: () {
          widget.onPressedLeft();
        },
      ),
    );

    final centerAvatar = Expanded(
      child: Material(
        elevation: 4.0,
        shape: CircleBorder(),
        color: Colors.transparent,
        child: Ink(
          width: 80.0,
          height: 80.0,
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new AssetImage("images/ic_male.png"),
            ),
          ),
          child: new Container(
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.only(top: 85.0),
            child: Center(
              child: new Text(
                widget.text,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14.0,
                  fontFamily: 'RobotoLight',
                  fontWeight: FontWeight.w300,
                ),
              ),
            ),
          ),
        ),
      ),
    );

    final rightMenu = Container(
//      color: Colors.orangeAccent,
      padding: const EdgeInsets.only(right: 10.0, bottom: 60.0),
      child: IconButton(
        icon: Icon(Icons.menu, size: 30.0, color: Colors.white),
        onPressed: () {
          widget.onPressedRight();
        },
      ),
    );

    return new Container(
      child: new Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.4,
          padding: const EdgeInsets.only(top: 10.0),
          decoration: new BoxDecoration(
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
              ],
            ),
          ),
          child: new Container(
            child: new Flex(
              direction: Axis.horizontal,
              children: <Widget>[leftMenu, centerAvatar, rightMenu],
            ),
          ),
        ),
      ),
    );
  }
}
