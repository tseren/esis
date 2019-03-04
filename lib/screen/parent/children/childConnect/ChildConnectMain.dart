import 'package:flutter/material.dart';
import 'package:esis/screen/parent/children/childConnect/ConnectHeader.dart';
import 'package:esis/screen/parent/pmain.dart';

class ChildConnectMain extends StatefulWidget {
  @override
  _ChildConnectMainState createState() => _ChildConnectMainState();
}

class _ChildConnectMainState extends State<ChildConnectMain> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[

        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: Colors.white,
        ),

        ConnectHeader(
          onPressedReturn: (){
            Navigator.push(context, MaterialPageRoute(builder: (context) =>parentMain() ));
          },
        ),

        new Column(
          children: <Widget>[

            SizedBox(height: MediaQuery.of(context).size.width * 0.2),

            Container(
              width: MediaQuery.of(context).size.width,
              height: 30,
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                    colors: [
                      Color(0xff1983F3),
                      Color(0xff6137F1),
                    ]
                )
              ),
              child: Material(
                type: MaterialType.transparency,
                child: Container(
                  child: new Text(
                    'Холбох хүсэлт гаргасан хүүхдүүд',
                    style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'Roboto',
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),

            ),

            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.7 + 20,
//              color: Colors.cyanAccent,
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (BuildContext context, int index){

                    return new Container(
                      padding: const EdgeInsets.all(5.0),
                      child: new Card(
                        elevation: 5.0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1.0),
                        ),
                        
                        child: new Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[

                            new Text('Эцэг эхийн нэр'),
                            new Text('Батмөнх Мөнхманлай'),

                            new Text('Суралцагчийн нэр'),
                            new Text('Баянмөнх Наранбат'),


                            new Text('Сургуулийн нэр'),
                            new Text('Ажилсаг залуус - Төслийн баг'),

                          ],
                        ),
                      ),
                    );
                  }
              ),
            ),


            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.1 - 10,
              padding: const EdgeInsets.only(left: 25.0, right: 25.0),
              child: new RaisedButton(
                  color: Colors.orange[400],
                  elevation: 5.0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                  onPressed: (){
                    print("ХҮҮХЭД ХОЛБОХ ХҮСЭЛТ");
                  },
                child: new Center(
                  child: new Text(
                    'ХҮҮХЭД ХОЛБОХ ХҮСЭЛТ',
                    style: new TextStyle(
                      fontSize: 15.0,
                      fontFamily: 'RobotoMedium',
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),


          ],
        )

      ],
    );

  }
}
