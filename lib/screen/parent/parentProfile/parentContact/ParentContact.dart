import 'package:flutter/material.dart';
import 'package:esis/widget/Modal.dart';
import 'package:esis/widget/ChildModal.dart';
import 'package:esis/widget/ParentHeader.dart';
import 'package:esis/screen/parent/pmain.dart';
import 'package:esis/screen/parent/ParentMenu.dart';

class ParentContact extends StatefulWidget {
  @override
  _ParentContactState createState() => _ParentContactState();
}

class _ParentContactState extends State<ParentContact> {

  int _currentIndex = 0;
  Modal personModal = new Modal();
  ChildModal childModal = new ChildModal();

  final List<Widget> _children = [ExpansionContact(), ExpansionContact(), ExpansionContact()];

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
              icon: new Icon(Icons.home),
              title: new Text('Үндсэн'),
            ),
            BottomNavigationBarItem(
              icon: new Icon(Icons.group),
              title: Text('Хүүхдүүд'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              title: Text('Тохиргоо'),
            ),
          ]
      ),
    );
  }
}


class ExpansionContact extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
              child: ListView.builder(
                  itemCount: data.length,
                  itemBuilder: (BuildContext context, int index) => EntryItem(data[index])),
            ),
          ],

        ),

      ],
    ),
  );

  }
}

// One Entry in the multilevel list displayed by this app.
class Entry {
  final String title;
  final List<Entry> children;
  Entry(this.title, [this.children = const<Entry>[]]);

}

// The entire multilevel list displayed by this app
final List<Entry> data = <Entry>[
    Entry('Утас',
     <Entry>[
       Entry('Ажлын утас'),
       Entry('Бусад утас'),
       Entry('Гэрийн утас'),
     ],
    ),
    Entry('Мэйл',
     <Entry>[
        Entry('Section B0'),
        Entry('Section B1'),
        Entry('Section B2'),
     ]
    ),
    Entry('Хаяг',
      <Entry>[
        Entry('C0'),
        Entry('C1'),
        Entry('C2'),
      ]
    ),
];

// Displays one Entry. If the entry has children then it's displayed
// with an ExpansionTile
class EntryItem extends StatelessWidget {
  final entry;
  const EntryItem(this.entry);

  Widget _buildTiles(Entry root){
    if(root.children.isEmpty)
      return ListTile(title: new Text(root.title));
    return ExpansionTile(
        key: PageStorageKey<Entry>(root),
        title: Text(root.title),
        children: root.children.map<Widget>(_buildTiles).toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return _buildTiles(entry);
  }
}
