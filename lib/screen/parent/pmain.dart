import 'package:flutter/cupertino.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:esis/widget/CardChild.dart';
import 'package:esis/widget/BottomNavMenu.dart';
import 'dart:io' show Platform;
import 'package:esis/widget/BtnConfirm.dart';
import 'package:device_info/device_info.dart';
import 'dart:async';
import 'package:esis/screen/parent/AChildren.dart';
import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:backdrop/backdrop.dart';
import 'package:esis/widget/Modal.dart';
import 'package:esis/screen/universal/login.dart';
import 'package:esis/widget/ChildModal.dart';
import 'package:esis/screen/parent/ParentMenu.dart';

import 'package:esis/screen/parent/children/StudentMain.dart';
import 'package:esis/screen/parent/children/childConnect/ChildConnectMain.dart';


void _OSChecker(){
  if(Platform.isAndroid){
    print("Running on Android");
  } else if(Platform.isIOS){
    print("Running on iOS");
  }
}

Widget myWidget(){
   return Material(
     color: Colors.orange,
     child: InkWell(
       onTap: (){},
       child: Container(
         width: 100.0,
         height: 100.0,
       ),
     ),
   );
}

class parentMain extends StatefulWidget {
  @override
  _parentMainState createState() => _parentMainState();
}

class _parentMainState extends State<parentMain> {
  var _main = true;
  bool _selected = true;
  bool _selected_child = false;
  int _currentIndex = 0;
  Modal modal = new Modal();
  ChildModal _childModal = new ChildModal();


  final List<Widget> _children = [
    ABasic(),
    ABasic(),
    ABasic(),
  ];

  void onTabTapped(int index) {

    if(index == 0){

    } else if (index == 1){
      print("Child Choose Pressed");
      _childModal.childBottomSheet(context);

    } else if(index == 2){
      print("Тохиргооны хэсэг");
      modal.mainBottomSheet(context);
    }

    setState(() {
      _currentIndex = index;
      _selected = false;
      _selected_child = true;
    });

  }

  @override
  Widget build(BuildContext context) {

    _OSChecker();

    if(_main){
      setState(() {
        _main = false;
      });
    }

    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: 0,
          fixedColor: Colors.black,
          onTap: onTabTapped,
          items: <BottomNavigationBarItem>[

          BottomNavigationBarItem(
            icon: new Image.asset("images/ic_home.png", width: 20, height: 20),
            title: new Text('Үндсэн', style: TextStyle(fontSize: 13.0, fontFamily: 'RobotoLight')),
          ),
          BottomNavigationBarItem(
              icon: new Image.asset("images/ic_group.png", width: 20, height: 20),
              title: new Text('Хүүхдүүд', style: TextStyle(fontSize: 13.0, fontFamily: 'RobotoLight')),
          ),
          BottomNavigationBarItem(
              icon: new Image.asset("images/ic_setting.png", width: 20, height: 20),
              title: new Text('Тохиргоо', style: TextStyle(fontSize: 13.0, fontFamily: 'RobotoLight')),
          )



          ]),
    );
  }
}

class ABasic extends StatelessWidget {

  void _deviceInfo() async{

    print("Internal text printed  widget context outline");
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print("Running on ${androidInfo.model} DEVICE");

    IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
    print("Running on ${iosInfo.utsname.machine} DEVICE");

  }

  @override
  Widget build(BuildContext context) {
    ParentMenu _parentMenu = new ParentMenu();
    final _headerWidth = MediaQuery.of(context).size.width;
    TargetPlatform platform;
    Widget icBtn, _titleChildConnect;
    final Orientation orientation = MediaQuery.of(context).orientation;
    final screen_width = MediaQuery.of(context).size.width;
    double width = (orientation == Orientation.portrait) ? screen_width / 3 - 12.0 : screen_width / 5 - 12.0;

    final prof = Container(
      child: Expanded(
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
              padding: const EdgeInsets.only(top: 110.0),
              child: Center(
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
        ),
      ),
    );





    final rightMenu = Container(
      alignment: Alignment.topRight,
      padding: const EdgeInsets.only(right: 10.0, top: 30.0),
      child: IconButton(
          icon: Icon(Icons.menu, color: Colors.white),
          iconSize: 30.0,
          onPressed: (){
            _parentMenu.menuBottomSheet(context);
          }
      ),
    );


    if (Platform.isAndroid) {
      icBtn = Expanded(
          child: IconButton(
            padding: const EdgeInsets.only(left: 310, top: 40.0),
            icon: Icon(Icons.menu, color: Colors.white),
            iconSize: 30.0,
            onPressed: () {
              print("Android button tapped");
              _parentMenu.menuBottomSheet(context);
            },
          ),
      );

    } else if (Platform.isIOS) {

      icBtn = Expanded(
        child: IconButton(
          padding: const EdgeInsets.only(left: 310, top: 40.0),
          icon: Icon(Icons.menu, color: Colors.white),
          iconSize: 30.0,
          onPressed: () {
            print("Android button tapped");
            _parentMenu.menuBottomSheet(context);
          },
        ),
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
                Navigator.push(context, MaterialPageRoute(builder: (context) => ChildConnectMain() ));
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
                  padding: const EdgeInsets.only(left: 80.0),
                  child: new Flex(
                      direction: Axis.horizontal,
                      children: <Widget>[ prof, rightMenu],
                  ),
                ),
              ),
            ),
          ),

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
                 shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(10.0),
                 ),
                 elevation: 4.0,
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
                                      print("________________________ хүүхэд : ${index} _____________________");
                                      Navigator.push(context, MaterialPageRoute(builder: (context) => StudentMain() ));
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

class AChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
//        _BlurChild(),
        ABasic(),
        new Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            AChildBody2(),
          ],
        ),

      ],
    );
  }
}

final ABasicBlur = Container(
  decoration: new BoxDecoration(
    image: new DecorationImage(
      image: new AssetImage("images/ic_board.png"),
      fit: BoxFit.cover,
    ),
  ),
  child: new BackdropFilter(
    filter: new ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
    child: new Container(
      decoration: new BoxDecoration(color: Colors.black.withOpacity(0.1)),
    ),
  ),
);


void CustomDialog(BuildContext context){
  print("______________ Custom Dialog _______________");
  showDialog(context: context, builder: (context) => _onTapGrid(context), barrierDismissible: true);
}

_onTapGrid(BuildContext context){
  return new GestureDetector(
    onTap: (){},
    child: new Stack(
      fit: StackFit.expand,
      children: <Widget>[
        BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
          child: Container(
            decoration: new BoxDecoration(color: Colors.black.withOpacity(0.1)),
          ),
        ),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: new Text(
              'CHILD',
            style: TextStyle(
              fontSize: 14.0,
              fontFamily: 'RobotoBold',
              fontWeight: FontWeight.w300,
            ),
          ),
        ),

      ],
    ),
  );
}



class _BlurChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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



        ],
      ),
    );
  }
}



class AChildBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        image: new DecorationImage(
            image: new AssetImage("images/ic_board.png"),
            fit: BoxFit.cover,
        ),
      ),
      child: BackdropFilter(
        filter: new ImageFilter.blur(sigmaX: 4.0, sigmaY: 4.0),
        child: Container(
          decoration: new BoxDecoration(color: Colors.black.withOpacity(0.1)),
        ),
      ),
    );
  }
}

class AChildBody2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 60,
      color: Colors.grey[500],
      child: GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: new Stack(
          fit: StackFit.expand,
          children: <Widget>[
            BackdropFilter(
                filter:ImageFilter.blur(sigmaX: 3.0, sigmaY: 3.0),
              child: Container(
                decoration: new BoxDecoration(color: Colors.black.withOpacity(0.1)),
              ),
            ),


          ],
        ),
      ),
    );
  }
}



class AConfig extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
    );
  }
}

class BackDropChild extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: BackdropScaffold(
        title: new Text("Backdrop Example"),
        backLayer: Center(
          child: Text('Back Layer'),
        ),
        frontLayer: Center(
          child: new Text('Front Layer'),
        ),
        iconPosition: BackdropIconPosition.leading,
        actions: <Widget>[
          BackdropToggleButton(
            icon: AnimatedIcons.list_view,
          )
        ],

      ),
    );
  }
}

class ABottomSheet extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    showModalBottomSheet(context: context, builder: (BuildContext bc){
      return  Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          _createTile(context, "Нууц үг солих", Icons.message, _action1),
          _createTile(context, "Системээс гарах", Icons.exit_to_app, _action2),
        ],
      );
    });

  }

  ListTile _createTile(BuildContext context, String name , IconData icon, Function action){
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: (){
        Navigator.pop(context);
        action();
      },
    );
  }

  _action1(){
    print("action 1");
  }

  _action2(){
    print("Системээс гарлаа");
//    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()));
  }

}




