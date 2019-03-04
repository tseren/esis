import 'package:flutter/material.dart';
import 'package:esis/widget/Modal.dart';
import 'package:esis/widget/ChildModal.dart';
import 'package:esis/screen/parent/ParentMenu.dart';
import 'package:esis/screen/parent/children/StudentHeader.dart';
import 'package:esis/screen/parent/pmain.dart';
import 'package:esis/screen/parent/children/StudentMenu.dart';


class StudentMain extends StatefulWidget {
  @override
  _StudentMainState createState() => _StudentMainState();
}

class _StudentMainState extends State<StudentMain> {

  int _currentIndex = 0;
  Modal personModal = new Modal();
  ChildModal childModal = new ChildModal();

  final List<Widget> _children = [StudentBody(), StudentBody(), StudentBody()];

  void onTabTapped(int index){
    if(index == 0){
       Navigator.push(context, MaterialPageRoute(builder: (context) => parentMain()));
    } else if(index == 1){
      childModal.childBottomSheet(context);
    } else if(index == 2){
      personModal.mainBottomSheet(context);
    }

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
                icon: Icon(Icons.home, size: 20.0,),
                title: new Text("Үндсэн",
                  style: TextStyle(fontSize: 14.0, fontFamily: 'RobotoLight'),
                ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.group, size: 20.0),
              title: Text("Хүүхдүүд", style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'RobotoLight',
               ),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Тохиргоо', style: TextStyle(
                fontSize: 14.0,
                fontFamily: 'RobotoLight',
              ),)
            ),

          ]
      ),

    );
  }
}


class StudentBody extends StatelessWidget {

  List<String> items;
  List<String> avatarImage;
  StudentBody({Key key, this.items, this.avatarImage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudentMenu stMenu = new StudentMenu();
    Orientation orientation = Orientation.portrait;
    items = ["Ирц чөлөө", "Үнэлгээ дүн", "Гэрийн даалгавар","Хичээлийн хуваарь","Сургуулийн мэдээлэл","Хөтөлбөр төлөвлөгөө", "Ном сурах бичиг", "Хичээл"];
    avatarImage = ["images/studentmain/ic_irts.png", "images/studentmain/ic_unelgee.png", "images/studentmain/ic_homework.png", "images/studentmain/ic_huwaari.png",
                                                                                        "images/studentmain/ic_irts.png", "images/studentmain/ic_irts.png",
                                                                                        "images/studentmain/ic_irts.png", "images/studentmain/ic_irts.png",];

    return Container(
     child: new Stack(
       children: <Widget>[

         StudentHeader(
           txt1: 'Б.Наранбат',
           txt2: 'Ажилсаг залуус төслийн баг',
           onPressLeft: (){
             print(" children menu left tapped ");
             Navigator.push(context, MaterialPageRoute(builder: (context) => parentMain() ));

             },
           onPressRight: (){
              print("children menu right tapped ");
              stMenu.studentBottomSheet(context);
             },
         ),

         new Column(
           mainAxisSize: MainAxisSize.max,
           mainAxisAlignment: MainAxisAlignment.start,
           children: <Widget>[

             SizedBox(
               height: MediaQuery.of(context).size.width * 0.3 - 15,
             ),

             Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height * 0.7,
               child: GridView.builder(
                   primary: true,
                   gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: (orientation == Orientation.portrait) ? 3 : 5),
                   itemCount: items.length,
                   itemBuilder: (BuildContext context, int index){
                     return Container(
                       padding: const EdgeInsets.all(8.0),
                       child: Material(
                         elevation: 4.0,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.circular(25.0),
                         ),
                         color: Colors.blue[600],
                         child: InkWell(
                           onTap: (){ print(" ${items[index]} "); },
                           borderRadius: BorderRadius.circular(25.0),
                           child: new Center(
                             child: new Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               mainAxisSize: MainAxisSize.min,

                               children: <Widget>[

                                 new Container(
                                   width: 40,
                                   height: 40,
                                   decoration: new BoxDecoration(
                                     image: new DecorationImage(
                                         image: AssetImage("images/studentmain/ic_irts.png"))
                                   ),
                                 ),

                                 new Container(
                                   width: 100,
                                   height: 40,
                                   child: Center(
                                     child: new Text(items[index],
                                     style: TextStyle(
                                       fontSize: 13.0,
                                       fontFamily: 'Roboto',
                                       color: Colors.white
                                     ),
                                       textAlign: TextAlign.center,
                                     ),
                                   ),
                                 ),


                               ],

                             ),

                           ),
                         ),
                       ),
                     );

                   }
               ),
             ),

           ],
         )


       ],
     ),
    );
  }
}
