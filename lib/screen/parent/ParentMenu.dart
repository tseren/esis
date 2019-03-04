import 'package:flutter/material.dart';
import 'package:esis/screen/parent/parentProfile/PersonInfo.dart';
import 'package:esis/screen/parent/parentProfile/parentContact/ParentContact.dart';
import 'package:esis/screen/parent/parentProfile/parentEducation/parentEduMain.dart';

List lst1 = ["Үндсэн мэдээлэл", "Холбоо барих"];
List lst2 = ["Боловсролын түүх", "Ажлын түүх"];

class ParentMenu {
  menuBottomSheet(BuildContext context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.5,
              color: Color(0xff373f53),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(height: 10.0),
                  Onelist(),
                  SizedBox(height: 10.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 15.0),
                    height: 10.0,
                    child: new Text(
                      'Бусад',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.0),
                  Twolist(),
                ],
              ),
            ),
          );
        });
  }
}

class Onelist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.width * 0.2 - 10,
        padding: const EdgeInsets.only(left: 5.0, right: 5.0),
//      color: Colors.purple,
        child: Flex(
          direction: Axis.horizontal,
          children: <Widget>[
            Expanded(
              child: new Container(
                padding: const EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width * 0.3 + 10,
                child: Material(
                  color: Color(0xff1888F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Ink(
                    width: 100,
                    padding: const EdgeInsets.all(7.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () {
                        Navigator.pop(context);
                        print("Үндсэн мэдээлэл");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => PersonInfo() ));
                      },
                      child: new Center(
                        child: new Text(
                          "Үндсэн мэдээлэл",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

            Expanded(
              child: new Container(
                padding: const EdgeInsets.all(5.0),
                width: MediaQuery.of(context).size.width * 0.3 + 10,
                child: Material(
                  color: Color(0xff1888F4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  child: Ink(
                    width: 100,
                    padding: const EdgeInsets.all(7.0),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12.0),
                      onTap: () {
                        Navigator.pop(context);
                        print("Холбоо барих");
                        Navigator.push(context, MaterialPageRoute(builder: (context) => ParentContact()));
                      },
                      child: new Center(
                        child: new Text(
                          "Холбоо барих",
                          style: TextStyle(
                            fontSize: 13.0,
                            fontFamily: 'Roboto',
                            color: Colors.white,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),

    );
  }
}

class Twolist extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.2 - 10,
      padding: const EdgeInsets.only(left: 5.0, right: 5.0),
//      color: Colors.purple,
      child: Flex(
        direction: Axis.horizontal,
        children: <Widget>[
          Expanded(
            child: new Container(
              padding: const EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width * 0.3 + 10,
              child: Material(
                color: Color(0xff1888F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Ink(
                  width: 100,
                  padding: const EdgeInsets.all(7.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () {
                      Navigator.pop(context);
                      print("Боловсролын түүх");
                      Navigator.push(context, MaterialPageRoute(builder: (context) => ParentEduMain() ));
                    },
                    child: new Center(
                      child: new Text(
                        "Боловсролын түүх",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

          Expanded(
            child: new Container(
              padding: const EdgeInsets.all(5.0),
              width: MediaQuery.of(context).size.width * 0.3 + 10,
              child: Material(
                color: Color(0xff1888F4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: Ink(
                  width: 100,
                  padding: const EdgeInsets.all(7.0),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(12.0),
                    onTap: () {
                      Navigator.pop(context);
                      print("Ажлын түүх");
                    },
                    child: new Center(
                      child: new Text(
                        "Ажлын түүх",
                        style: TextStyle(
                          fontSize: 13.0,
                          fontFamily: 'Roboto',
                          color: Colors.white,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),

        ],
      ),

    );
  }
}
