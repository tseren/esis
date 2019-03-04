import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/foundation.dart';
import 'package:esis/widget/ParentHeader.dart';
import 'package:esis/screen/parent/pmain.dart';
import 'package:esis/widget/BottomNavMenu.dart';
import 'package:esis/widget/Modal.dart';
import 'package:esis/widget/ChildModal.dart';
import 'package:esis/screen/parent/pmain.dart';
import 'package:esis/screen/parent/ParentMenu.dart';
import 'package:esis/utils/user.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:esis/utils/Photo.dart';

List<String> lHint = [
  "Ургийн овог",
  "Овог",
  "Өөрийн нэр",
  "Төрсөн огноо",
  "Хүйс",
  "Регистр",
  "Иргэншил"
];
List<String> lTxt = [
  "Ямаатын",
  "Батмөнх",
  "Мөнхманлай",
  "1986-04-16",
  "Эрэгтэй",
  "ЛЖ86041617",
  "Монгол"
];

List datas = new List();
String jsonString =
    '[{"optiontext" : "One" ,"optionvalue" : "Value"}, {"optiontext" : "Two", "optionvalue" : "Value"}]';

class PersonInfo extends StatefulWidget {
  @override
  _PersonInfoState createState() => _PersonInfoState();
}

class _PersonInfoState extends State<PersonInfo> {
  int _currentIndex = 0;
  Modal personModal = new Modal();
  ChildModal childModal = new ChildModal();
  final List<Widget> _children = [
    ParentPersonBody(),
    ParentPersonBody(),
    ParentPersonBody()
  ];

  // Json Server

  var user_data = User();

  void onTabTapped(int index) {
    if (index == 0) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => parentMain()));
    } else if (index == 1) {
      childModal.childBottomSheet(context);
    } else if (index == 2) {
      personModal.mainBottomSheet(context);
    }
    print(index);
    setState(() {
      _currentIndex = index;
    });
  }

  // A function that converts a response body into a List<Photo>
  List<Photo> parsePhotos(String responseBody) {
    final parsed = json.decode(responseBody).cast<Map<String, dynamic>>();
    return parsed.map<Photo>((json) => Photo.fromJson(json)).toList();
  }

  Future<List<Photo>> fetchPhotos(http.Client client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/photos');
    return parsePhotos(response.body);
  }

  List data;
  Future<String> getData() async {
    var response = await http.get(
        Uri.encodeFull("https://jsonplaceholder.typicode.com/posts"),
        headers: {"Accept": "application/json"});

    setState(() {
      data = json.decode(response.body);
    });

    print(data[1]["title"]);

    return "Success!";
  }

  @override
  void initState() {
    super.initState();
    this.getData();
    datas.add('');

//    '[{"optiontext" : "One" ,"optionvalue" : "Value"}, {"optiontext" : "Two", "optionvalue" : "Value"}]';
  }

  @override
  Widget build(BuildContext context) {
    final screen_width = MediaQuery.of(context).size.width;
    final screen_height = MediaQuery.of(context).size.height;
    final height = MediaQuery.of(context).size.width * 0.3;

    print(json.encode(user_data));
    print(
        " _________________________________ Хувийн мэдээлэл __________________________________________ ");
    print(screen_width);
    print(height);

    final listView = ListView.builder(
        itemCount: lHint.length,
        itemBuilder: (context, position) {
//        return new Text(litems[position]);
          return new Container(
            color: Colors.white,
            child: Row(
              children: <Widget>[
                new Padding(
                  padding: const EdgeInsets.only(left: 20.0),
                  child: Center(
                    child: new Text(
                      lHint[position],
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'RobotoLight',
                      ),
                    ),
                  ),
                ),
                new Container(
                  child: Center(
                    child: new Text(
                      lHint[position],
                      style: TextStyle(
                        fontSize: 14.0,
                        fontFamily: 'RobotoLight',
                      ),
                    ),
                  ),
                ),
                new Divider(
                  color: Colors.grey,
                  height: 1.0,
                ),
              ],
            ),
          );
        });

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
          ]),
    );
  }
}

class ParentPersonBody extends StatelessWidget {
  ParentMenu parentMenu = new ParentMenu();

  @override
  Widget build(BuildContext context) {
    final iPhone6_width = MediaQuery.of(context).size.width;
    final iPhone6_height = MediaQuery.of(context).size.height;
    final porcent = MediaQuery.of(context).size.width * 0.4;

    print(iPhone6_width);
    print(iPhone6_height);
    print(porcent);

    return Container(
      child: new Stack(
        children: <Widget>[

          // Header Section

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
              
              new Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height -
                    (MediaQuery.of(context).size.width * 0.5 + 25),
                color: Colors.grey[300],
                child: new ListView.builder(
                    itemCount: lHint.length,
                    itemBuilder: (BuildContext context, int index) {
                      return new Container(
                        child: new Card(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 40.0, right: 10.0),
                            child: ListTile(
                              title: new Text(
                                lHint[index],
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'RobotoLight',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              trailing: new Text(
                                lTxt[index],
                                style: TextStyle(
                                  fontSize: 14.0,
                                  fontFamily: 'RobotoLight',
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
              ),
            ],
          ),

//         BottomNavMenu(),
        ],
      ),
    );
  }

  Widget _buildList() {
    ListView(
      children: <Widget>[
        _tile('CineArts at the Empire', '85 W Portal Ave', Icons.theaters),
        _tile('The Castro Theater', '429 Castro St', Icons.theaters),
        _tile('Alamo Drafthouse Cinema', '2550 Mission St', Icons.theaters),
        _tile('Roxie Theater', '3117 16th St', Icons.theaters),
        _tile('United Artists Stonestown Twin', '501 Buckingham Way',
            Icons.theaters),
        _tile('AMC Metreon 16', '135 4th St #3000', Icons.theaters),
        Divider(),
        _tile(
            'Kescaped_code#39;s Kitchen', '757 Monterey Blvd', Icons.theaters),
        _tile('Emmyescaped_code#39;s Restaurant', '1923 Ocean Ave',
            Icons.theaters),
        _tile('Chaiya Thai Restaurant', '272 Claremont Blvd', Icons.theaters),
        _tile('La Ciccia', '291 30th St', Icons.theaters),
      ],
    );
  }

  ListTile _tile(String title, String subtitle, IconData icon) {
    ListTile(
      title: Text(
        title,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 20,
        ),
      ),
      subtitle: Text(subtitle),
      leading: Icon(
        icon,
        color: Colors.blue[500],
      ),
    );
  }
}

class UserWidget extends StatelessWidget {
  final String firstName;
  final String lastName;
  final String imageURL;

  const UserWidget({Key key, this.firstName, this.lastName, this.imageURL})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: new BoxDecoration(
        border: new Border.all(width: 1.0, color: Colors.grey),
        color: Colors.white70,
      ),
      child: new ListTile(
        leading: new FadeInImage(
          placeholder: new AssetImage("images/ic_male.png"),
          image: new NetworkImage(imageURL),
        ),
        title: new Text("First Name : " + firstName),
        subtitle: new Text("Last Name : " + lastName),
      ),
    );
  }
}
