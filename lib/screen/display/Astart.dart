import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Astart extends StatelessWidget {
  String text;
  bool animate;
  Astart({this.text, this.animate});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
         body: Container(
           width: MediaQuery.of(context).size.width,
           height: MediaQuery.of(context).size.height,

         ),
    );
  }
}
