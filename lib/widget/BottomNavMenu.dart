import 'package:flutter/material.dart';
import 'package:esis/screen/parent/pmain.dart';
import 'package:esis/widget/ChildModal.dart';
import 'package:esis/widget/Modal.dart';

class BottomNavMenu extends StatefulWidget {
  @override
  _BottomNavMenuState createState() => _BottomNavMenuState();
}

class _BottomNavMenuState extends State<BottomNavMenu> {

  int _currentIndex = 0;
  Modal modal = new Modal();
  ChildModal _childModal = new ChildModal();

  final List<Widget> _children = [ ABasic(), ABasic(), ABasic()];

  void onTabTapped(int index){
    if(index == 1){
       _childModal.childBottomSheet(context);
    } else if(index == 2){
      modal.mainBottomSheet(context);
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
              icon: new Icon(Icons.home),
              title: new Text('Үндсэн'),
            ),

            BottomNavigationBarItem(
              icon: new Icon(Icons.group),
              title: new Text("Хүүхдүүд"),
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
