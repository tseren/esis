import 'package:flutter/material.dart';

class ForgetPass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: new Text('Нууц үг мартсан уу'),
        ),
      ),
    );
  }
}
