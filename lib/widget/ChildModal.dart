import 'package:flutter/material.dart';

class ChildModal {
  childBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return SafeArea(
              child: Container(
//            height: 80.0,
              color: Color(0xff373f54),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                    HorizList(),
                ],
              ),
           ),
          );
        });
  }
}


class HorizList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.0,
      child: new ListView.builder(itemBuilder: (context, index){
        return new Container(
          padding: const EdgeInsets.only(left: 5.0, right: 5.0, top: 10.0),
          child: Column(
            children: <Widget>[

              Material(
                type: MaterialType.transparency,
                elevation: 4.0,
                shape: CircleBorder(),
                color: Colors.transparent,
                child: Ink(
                  width: 80.0,
                  height: 40.0,
                  decoration: new BoxDecoration(
                    image: new DecorationImage(
                        image: new AssetImage("images/ic_male.png"),
                    )
                  ),
                  child: InkWell(
                    onTap: (){
                      print("Grid BottomSheet OnClick");
                      Navigator.pop(context);
                    },
                    splashColor: Colors.transparent,
                    child: new Container(
                      padding: const EdgeInsets.only(top: 50.0),
                      child: new Center(
                        child: new Text(
                          'Б.Батсайхан',
                          style: TextStyle(
                            fontFamily: 'RobotoLight',
                            fontSize: 12.0,
                            fontWeight: FontWeight.w300,
                            color: Colors.white,
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
      },
        scrollDirection: Axis.horizontal,
        itemCount: 10,
      ),
    );
  }
}
