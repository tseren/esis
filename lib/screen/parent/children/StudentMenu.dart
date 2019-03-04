import 'package:flutter/material.dart';

List data = ["Үндсэн мэдээлэл", "Эзэмшсэн боловсрол", "Цол, шагнал зэрэг"];
List data2 = ["Дүнгийн мэдээлэл", "Хөтөлбөр төлөвлөгөө", "Эрүүл мэнд"];
List data3 = ["Холбоо барих", "Шилжилт хөдөлгөөн", "Нэмэлт мэдээлэл"];

class StudentMenu {
  studentBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return SafeArea(
            child: Container(
              height: MediaQuery.of(context).size.width * 0.7 + 10,
              color: Color(0xff373f54),
              child: new Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  SizedBox(
                    height: 10.0,
                  ),

                  OneScreen(),
                  SizedBox(height: 10.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 10.0),
                    height: 10.0,
                    child: new Text(
                      'Нэмэлт мэдээлэл',
                      style: TextStyle(
                        fontSize: 15.0,
                        fontFamily: 'Roboto',
                        color: Colors.white,
                      ),
                    ),
                  ),

                  SizedBox(height: 10.0),


                  TwoScreen(),

                  SizedBox(height: 10.0),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    padding: const EdgeInsets.only(left: 10.0),
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
                  ThreeScreen(),

                ],
              ),
            ),
          );
        });
  }
}

class GridMenu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final Orientation orientation = MediaQuery.of(context).orientation;
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width * 0.9,
      child: new  GridView.builder(
          gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: (orientation == Orientation.portrait) ? 3 : 5,
            childAspectRatio: 1.2,
          ),
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index){
              return Card(
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: new GridTile(
                      child: new Text('HI'),
                  ),
                ),
              );
          })
    );
  }
}

class OneScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.width * 0.2 - 10,
      alignment: AlignmentDirectional.center,
//      color: Colors.purple,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index){
            return new Container(
              padding: const EdgeInsets.all(5.0),
//              width: 135,
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
                    onTap: (){
                      Navigator.pop(context);
                      print(data[index]);
                      },
                    child: new Center(
                      child: new Text(
                        data[index],
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

            );

          }
      ),
    );
  }
}

class TwoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.width * 0.2 - 10,
//      color: Colors.purple,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data2.length,
          itemBuilder: (BuildContext context, int index){
            return new Container(
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
                    onTap: (){
                      Navigator.pop(context);
                      print(data2[index]);
                      },
                    child: new Center(
                      child: new Text(
                        data2[index],
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

            );

          }
      ),
    );

  }
}

class ThreeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width ,
      height: MediaQuery.of(context).size.width * 0.2 - 10,
//      color: Colors.purple,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (BuildContext context, int index){
            return new Container(
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
                    onTap: (){
                      Navigator.pop(context);
                      print(data3[index]);
                      },
                    child: new Center(
                      child: new Text(
                        data3[index],
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

            );

          }
      ),
    );


  }
}


