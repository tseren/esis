import 'package:flutter/material.dart';

class BtnConfirm extends StatefulWidget {
  Color splash = Color(0xff624594);
  Color color = Colors.white;
  Color textColor = Color(0xffd6b9e1);
  Color borderColor = Color(0xffa971bc);

  final GestureTapCallback onPressed;
  String text = "text";

  BtnConfirm(
      {Key key,
      this.splash,
      this.color,
      this.textColor,
      this.borderColor,
      this.onPressed,
      this.text}) : super(key: key);

  @override
  _BtnConfirmState createState() => _BtnConfirmState();
}

class _BtnConfirmState extends State<BtnConfirm> {
  @override
  Widget build(BuildContext context) {
    bool isPressed = false;
    double width = MediaQuery.of(context).size.width;
    double screen_width = width * 0.7;

    return Center(
      child: Container(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        width: MediaQuery.of(context).size.width,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: isPressed ? 0.0 : 5.0,
          shadowColor: Colors.black,
          child: Container(
            decoration: BoxDecoration(
              color: widget.color,
              borderRadius: BorderRadius.circular(10.0),
              shape: BoxShape.rectangle,
              border: Border.all(color: widget.borderColor, width: 1.5),
            ),
            child: Material(
              type: MaterialType.transparency,
              color: Colors.transparent,
              child: InkWell(
                splashColor: widget.splash,
                onTap: (){
                  widget.onPressed();
                },
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: EdgeInsets.all(15.0),
                  child: Center(
                    child: Text(
                      widget.text,
                      style: TextStyle(
                        color: widget.textColor,
                        fontSize: 14.0,
                        fontFamily: 'RobotoLight'
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
