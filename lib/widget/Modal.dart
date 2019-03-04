import 'package:flutter/material.dart';
import 'package:esis/screen/universal/login.dart';

class Modal {
  mainBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              color: Color(0xff373f54),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  //                _createTile(context, 'Нууц үг солих', Icons.lock, _action1),
                  //                _createTile(context, 'Системээс гарах', Icons.exit_to_app, _action2),

                  ListTile(
                    leading: Icon(Icons.lock, color: Colors.white, size: 30),
                    title: new Text(
                      "Нууц үг солих",
                      style: TextStyle(
                          fontSize: 14.0,
                          fontFamily: 'RobotoBold',
                          color: Colors.white),
                    ),
                  ),

                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 1.0,
                    padding: const EdgeInsets.only(left: 20.0, right: 20.0),
                    color: Colors.white,
                  ),

                  ListTile(
                    leading: Icon(
                      Icons.exit_to_app,
                      color: Colors.white,
                      size: 30.0,
                    ),
                    title: new Text(
                      'Системээс гарах',
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'RobotoBold',
                        color: Colors.white,
                      ),
                    ),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Login()));
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  ListTile _createTile(
      BuildContext context, String name, IconData icon, Function action) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(name,
          style: TextStyle(
              fontSize: 14.0, fontFamily: 'RobotoBold', color: Colors.white)),
      onTap: () {
        Navigator.pop(context);
        action();
      },
    );
  }

  _action1() {
    print("нууц үг солих");
  }

  _action2() {
    print("системээс гарах");
  }
}
