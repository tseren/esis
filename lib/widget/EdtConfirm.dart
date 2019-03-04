import 'package:flutter/material.dart';

class EdtConfirm extends StatefulWidget {

  Color textColor = Colors.white;
  Color color = Color(0xff156FD6);
  Color cursorColor = Colors.white;
  String hintTxt = 'text';
  String txt = '';

  EdtConfirm({
    Key key,
    this.textColor,
    this.color,
    this.cursorColor,
    this.hintTxt,
    this.txt,
  }) : super(key: key);

  @override
  _EdtConfirmState createState() => _EdtConfirmState();
}

class _EdtConfirmState extends State<EdtConfirm> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
         margin: const EdgeInsets.only(left: 24.0, right: 24.0),
         child: TextFormField(
           style: new TextStyle(
             color: widget.textColor,
             fontFamily: 'RobotoLight',
           ),
           keyboardType: TextInputType.emailAddress,
           autofocus: false,
           initialValue: '',
           cursorColor: widget.color,
           decoration: InputDecoration(
             fillColor: widget.color,
             filled: true,
             prefixIcon: Icon(
               Icons.person,
               color: widget.textColor,
               size: 20.0,
             ),
             hintText: widget.hintTxt,
             hintStyle: TextStyle(
               fontWeight: FontWeight.w300,
               color: widget.textColor,
               fontFamily: 'RobotoLight'
             ),
             contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
             enabledBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(12.0),
               borderSide: const BorderSide(color: Colors.white, width: 1.0),
             ),
             focusedBorder: OutlineInputBorder(
               borderRadius: BorderRadius.circular(12.0),
               borderSide: const BorderSide(color: Colors.white, width: 1.0),
             )
           ),
         ),
      ),
    );
  }
}
