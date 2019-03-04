import 'package:flutter/material.dart';
import 'package:esis/widget/PlaceholderWidget.dart';
import 'dart:ui';
import 'dart:io' show Platform;
import 'package:esis/screen/parent/pmain.dart';

final prof = Center(
  child: Material(
    elevation: 4.0,
    shape: CircleBorder(),
    color: Colors.transparent,
    child: Ink(
      width: 100.0,
      height: 100.0,
      decoration: new BoxDecoration(
        image: new DecorationImage(
          image: new AssetImage("images/ic_male.png"),
        ),
      ),
      child: new Container(
        padding: const EdgeInsets.only(top: 115.0),
        child: new Text(
          'Б.Мөнхманлай',
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
);

class AChildren extends StatefulWidget {
  @override
  _AChildrenState createState() => _AChildrenState();
}

class _AChildrenState extends State<AChildren> {

  int _currentIndex = 0;
  final List<Widget> _children = [
//     ABasic(),
//     AChild(),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          fixedColor: Colors.black,
          onTap: onTabTapped,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: new Icon(Icons.home),
              title: new Text('Үндсэн'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.mail),
              title: new Text('Хүүхдүүд'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.settings),
              title: new Text('Тохиргоо'),
            ),
          ]),
    );
  }

}

class AChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: Colors.indigo,
    );
  }
}



class ABasic2 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final _headerWidth = MediaQuery.of(context).size.width;
    TargetPlatform platform;
    Widget icBtn, _titleChildConnect;
    final Orientation orientation = MediaQuery.of(context).orientation;
    final screen_width = MediaQuery.of(context).size.width;
    double width = (orientation == Orientation.portrait) ? screen_width / 3 - 12.0 : screen_width / 5 - 12.0;

    if (Platform.isAndroid) {
      icBtn = IconButton(
        padding: const EdgeInsets.only(left: 310, top: 40.0),
        icon: Icon(Icons.menu, color: Colors.white),
        iconSize: 30.0,
        onPressed: () {
          print("Android button tapped");
        },
      );
    } else if (Platform.isIOS) {
      icBtn = IconButton(
        padding: const EdgeInsets.only(left: 330, top: 40.0),
//        icon: Image.asset("images/ic_menu.png"),
        icon: Icon(Icons.menu, color: Colors.white),
        iconSize: 30.0,
        onPressed: () {
          print("IOS Button tapped");
        },
      );
    }

    final title = Container(
      width: MediaQuery.of(context).size.width-140,
      padding: const EdgeInsets.only(left: 15.0),
      alignment: AlignmentDirectional.topStart,
      child: Text(
        'МИНИЙ ХҮҮХДҮҮД',
        style: TextStyle(
          fontSize: 14.0,
          fontFamily: 'RobotoLight',
          fontWeight: FontWeight.w300,
        ),
      ),
    );

    final _childConnect = Container(
      alignment: AlignmentDirectional.topEnd,
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),

        ),
        onPressed: () {
          print("child Connect tapped");
        },
        color: Colors.orange[700],

        child: Text(
          'Хүүхэд холбох',
          style: TextStyle(
            color: Colors.white,
            fontFamily: 'RobotoLight',
            fontSize: 14.0,
          ),
        ),
      ),
    );

    final _childConnected = Container(
      padding: const EdgeInsets.only(left: 14.0),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5.0),
        ),
        elevation: 4.0,
        shadowColor: Colors.black,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.orange[700],
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(color: Colors.yellow[300], width: 1),
          ),
          child: Material(
            type: MaterialType.transparency,
            color: Colors.transparent,
            child: InkWell(
              onTap: (){
                print("Хүүхэд холбох товч дарагдлаа.");
              },
              child: Container(
                padding: const EdgeInsets.only(left: 10.0, top: 8.0, right: 10.0, bottom: 8.0),
                child: Center(
                  child: new Text(
                    'Хүүхэд холбох',
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
        ),
      ),
    );

    print("____________________ System started __________________");
//    _deviceInfo();
    print(width);
    print(orientation);
    print(screen_width);
    print("____________________ System end _____________________");


    return Container(
      child: new Stack(
        children: <Widget>[
          new Container(
            child: Material(
              child: new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.5,
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
                        1.0
                      ]),
                ),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  alignment: AlignmentDirectional.center,
                  child: prof,
                ),
              ),
            ),
          ),
          icBtn,
          new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              SizedBox(
                height: MediaQuery.of(context).size.width * 0.5 + 10,
              ),

              Row(
                children: <Widget>[
                  title,
                  _childConnected,
                ],
              ),

              new Container(
                padding: const EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width * 0.8,
                child: Card(
                  child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: const EdgeInsets.all(20.0),
                      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: (orientation == Orientation.portrait) ? 3 : 5,
                        childAspectRatio: 0.8,
//                         childAspectRatio: width / (width * 1.4)     (1.1)
                      ),
                      itemCount: 6,
                      itemBuilder: (context, index){
                        return Container(
//                          color: Colors.cyan[400],
                          padding: const EdgeInsets.only(left: 5.0, right: 5.0),
                          child: Column(
                            children: <Widget>[

                              Material(
                                elevation: 4.0,
                                shape: CircleBorder(),
                                color: Colors.transparent,
                                child: Ink(
                                  width: 60.0,
                                  height: 60.0,
                                  decoration: new BoxDecoration(
                                      image: new DecorationImage(
                                        image: new AssetImage("images/ic_male.png"),
                                      )
                                  ),
                                  child: InkWell(
                                    onTap: (){
                                      print("TAPPED");
                                    },
                                  ),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(top: 10.0),
                                child: Center(
                                  child: new Text(
                                    'Б.Батсайхан',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoBold',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),

                              Container(
                                padding: EdgeInsets.only(top: 5.0),
                                child: Center(
                                  child: new Text(
                                    '38 cургууль',
                                    style: TextStyle(
                                      fontSize: 14.0,
                                      fontFamily: 'RobotoLight',
                                      fontWeight: FontWeight.w300,
                                    ),
                                  ),
                                ),
                              ),

                            ],
                          ),
                        );
                      }
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}


