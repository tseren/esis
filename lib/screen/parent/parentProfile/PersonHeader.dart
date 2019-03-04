import 'package:flutter/material.dart';
import 'package:esis/widget/ParentHeader.dart';
import 'package:esis/screen/parent/parentProfile/parentEducation/parentEduMain.dart';

class PersonHeader extends StatefulWidget {
  @override
  _PersonHeaderState createState() => _PersonHeaderState();
}

class _PersonHeaderState extends State<PersonHeader> {

  @override
  Widget build(BuildContext context) {

    return Container(
      child: new Stack(
        children: <Widget>[

          ParentHeader(
            text: "Хувийн мэдээлэл",
            onPressedLeft: (){
                 Navigator.push(context, MaterialPageRoute(builder: (context) =>  ParentEduMain()));
              },
            onPressedRight: (){
                print("right menu");
               },
          ),

        ],
      ),
    );
  }
}
