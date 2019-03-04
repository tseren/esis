import 'package:flutter/material.dart';
class StudentHeader extends StatefulWidget {
  final GestureTapCallback onPressLeft;
  final GestureTapCallback onPressRight;
  String txt1 = "";
  String txt2 = "";

  StudentHeader({Key key, this.onPressLeft, this.onPressRight, this.txt1, this.txt2}): super(key:key);

  @override
  _StudentHeaderState createState() => _StudentHeaderState();
}

class _StudentHeaderState extends State<StudentHeader> {
  @override
  Widget build(BuildContext context) {
    final leftmenu = Container(
      padding: const EdgeInsets.only(left: 5.0, top: 20.0),
      child: IconButton(
          icon: Icon(Icons.chevron_left, size: 30.0, color: Colors.white,),
          onPressed: (){
            widget.onPressLeft();
          }
      ),
    );

    final title = Expanded(
          child: Material(
            color: Colors.transparent,
            child: Ink(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                
                new Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CircleAvatar(
                    radius: 25.0,
                    child: ClipOval(
                      child: Image.asset("images/ic_male.png"),
                    ),
                  ),
                ),

                  new Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[

                      SizedBox(
                        height: 45.0,
                      ),

                      new Padding(padding: const EdgeInsets.only(top: 1.0, right: 90.0),
                        child: new Text(widget.txt1, style: TextStyle(fontSize: 15.0, fontFamily: 'Roboto', color: Colors.white)),
                      ),


                      new Padding(padding: const EdgeInsets.only(left: 5.0),
                        child: new Text(widget.txt2, style: TextStyle(fontSize: 14.0, fontFamily: 'Roboto', color: Colors.white),),
                      ),

                    ],
                  ),


                ],

              ),

            ),
          ),
    );

    final rightmenu = Container(
      padding: const EdgeInsets.only(right: 5.0, top: 20.0),
      child: IconButton(
          icon: Icon(Icons.dashboard, size: 30.0, color: Colors.white),
          onPressed: (){
            widget.onPressRight();
          }
      ),
    );

    return Container(
      child: new Material(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width * 0.3 - 20,
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
              ]
            ),
          ),
          child: new Container(
            child: new Flex(
              direction: Axis.horizontal,
              children: <Widget>[ leftmenu, title, rightmenu ],
            ),
          ),
        ),
      ),
    );
  }
}
