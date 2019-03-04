import 'package:flutter/material.dart';
import 'package:esis/widget/Modal.dart';
import 'package:esis/widget/ChildModal.dart';
import 'package:esis/widget/ParentHeader.dart';
import 'package:esis/screen/parent/pmain.dart';
import 'package:esis/screen/parent/ParentMenu.dart';

class ParentEduMain extends StatefulWidget {
  @override
  _ParentEduMainState createState() => _ParentEduMainState();
}

class _ParentEduMainState extends State<ParentEduMain> {

  int _currentIndex = 0;
  Modal personModal = new Modal();
  ChildModal childModal = new ChildModal();
  
  final List<Widget> _children = [ParentEducation(), ParentEducation(), ParentEducation()];


  @override
  void initState() {
    super.initState();
  }
  
  void onTabTapped(int index){
    if(index == 0){
      Navigator.push(context, MaterialPageRoute(builder: (context) => parentMain() ));
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
              onTap: onTabTapped,
              fixedColor: Colors.black,
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: new Icon(Icons.home),
                  title: new Text('Үндсэн'),
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.group),
                  title: new Text('Хүүхдүүд')
                ),
                BottomNavigationBarItem(
                  icon: new Icon(Icons.settings),
                  title: new Text("Тохиргоо"),
                ),
              ]
          ),
    );
  }

}


class ParentEducation extends StatelessWidget {

  List cards = new List.generate(20, (i)=>new CustomCard());
  @override
  Widget build(BuildContext context) {
//    return Container(
//      child: new ListView(
//          children: cards,
//      ),
//    );

    ParentMenu parentMenu = new ParentMenu();
      return Container(
        child: new Stack(
          children: <Widget>[

            ParentHeader(
              text: "Б.Мөнхманлай",
              onPressedLeft: () {
//              Navigator.pop(context);
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => parentMain()));
              },
              onPressedRight: () {
                parentMenu.menuBottomSheet(context);
              },
            ),

            new Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[

                SizedBox(
                  height: MediaQuery.of(context).size.width * 0.4,
                ),

                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - (MediaQuery.of(context).size.width * 0.5 + 25),
                  color: Colors.grey[300],
                  child:  ListView(
                    children: List.generate(20, (i) => new CustomCard()),
                  )
                )

              ],
            ),

          ],
        ),
      );
  }
}

class CustomCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Card(
      margin: const EdgeInsets.all(5.0),
      child: new Column(
        children: <Widget>[
//          new Image.network('https://i.ytimg.com/vi/fq4N0hgOWzU/maxresdefault.jpg'),
          new Container(),
          new Padding(
            padding: new EdgeInsets.all(7.0),
            child: Flex(
              direction: Axis.horizontal,
              children: <Widget>[

                new Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: new Text('Major', style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'RobotoLight',
                      fontWeight: FontWeight.w700,
                    ),),
                  ),
                ),

                new Expanded(
                  child: new Icon(Icons.delete, color: Colors.orange[300], size: 30.0),
                ),
                new Expanded(
                  child: new Icon(Icons.edit, color: Colors.orange[300], size: 30.0),
                ),

              ],
            ),
          ),


          new Divider(height: 2.0, color: Colors.grey,),

          new Text('Сургууль'),
          new Text('Анагаахын шинжлэх ухааны үндэсний их сургууль'),
          new Text('Хаяг'),
          new Text('Монгол'),




        ],
      ),
    );
  }
}
