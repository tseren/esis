import 'package:flutter/material.dart';
import 'package:esis/screen/universal/login.dart';
import 'package:esis/screen/parent/pmain.dart';
import 'package:esis/widget/CircleAvatar.dart';
import 'package:esis/screen/parent/AChildren.dart';
import 'package:esis/screen/parent/AMain.dart';
import 'package:esis/screen/parent/pmain.dart';
import 'package:esis/screen/parent/parentProfile/PersonHeader.dart';
import 'package:esis/screen/parent/tester/TBasic.dart';
import 'package:esis/widget/BottomNavMenu.dart';
import 'screen/parent/parentProfile/parentEducation/parentEduMain.dart';

import 'screen/parent/tester/THomePage.dart';
import 'screen/parent/parentProfile/parentContact/ParentContactListTile.dart';
import 'utils/NetworkUtils.dart';

import 'screen/parent/tester/json/Calling.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.blue,
        fontFamily: 'RobotoLight',
      ),
      home: Login(),
    );
  }
}

