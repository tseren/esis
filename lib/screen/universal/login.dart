import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:esis/screen/parent/pmain.dart';
import 'package:esis/widget/BtnConfirm.dart';
import 'package:esis/widget/EdtConfirm.dart';
import 'package:flutter/src/material/text_form_field.dart';
import 'package:esis/utils/NetworkUtils.dart';
import 'package:esis/utils/service.dart';

///   POST - send
///   GET  - read
///   PUT - update
///   DELETE - delete
///   CRUD

class Login extends StatefulWidget {
  Color splash = Color(0xff624594);
  Color color = Colors.white;
  Color textColor = Color(0xffd6b9e1);
  Color borderColor = Color(0xffa971bc);
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final edtEmailController = TextEditingController();
  final edtPassController = TextEditingController();
  bool _validateEmail = false;
  bool _validatePass = false;

  String url2 = "https://randomuser.me/api/";


  Future<String> makeRequest() async {
    var response = await http.get(Uri.encodeFull(url2), headers: {"Accept": "application/json"});

    print(response.body);

  }


  postRequest() async {
    var url = Service.mainservice + "login";
    var name = edtEmailController.text;
    var pass = edtPassController.text;
    var body = jsonEncode({"userName":"BManlai@gmail.com", "password":"Manlai123"});
    print(url);
    print(body);

    http.post(url, headers: {"Content-Type":"application/json"}, body: body).then((res){
      print("Response status: ${res.statusCode}");
      print("Response body: ${res.contentLength}");
      print(res.headers);
      print(res);
    });
  }
  
  void create() async {
    final Map<String, String> jsonData1 = {
      "userName": "${edtEmailController.text}",
      "password": "${edtPassController.text}",
    };

    final Map<String, String> jsonData = {
      "username": "tomaduu@gmail.com",
      "password": "SW5kcmFuaWwx",
    };
    
    var response = await http.post('http://parent.esis.edu.mn/api/login', headers: {
      "Accept": "application/json",},
       body: json.encode(jsonData),
    );
    print(jsonData);
    print(response.body);
    print(response.request);

  }

  sendRequest() async {
          Map data = {"userName": "tomaduu@gmail.com", "password":"SW5kcmFuaWwx"};
          var url = 'https://parent.esis.edu.mn/api/login';
          http.post(url, body: data).then((http.Response res){
             print("response status: ${res.statusCode}");
             print("response body: ${res.body}");

          });
  }



  @override
  void initState() {
     super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    edtEmailController.dispose();
    edtPassController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
    double width = MediaQuery.of(context).size.width;
    double screen_width = width * 0.7;

    final email = Center(
      child: Container(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: TextField(
          controller: edtEmailController,
          style: new TextStyle(color: Colors.white, fontFamily: 'RobotoLight'),
          keyboardType: TextInputType.emailAddress,
          autofocus: false,
          cursorColor: Colors.white,
          decoration: InputDecoration(
            errorText: _validateEmail ? 'Нэвтрэх нэрээ оруулна уу' : null,
            errorStyle: TextStyle(
              color: Colors.red,
              fontFamily: 'RobotoLight'
            ),
            fillColor: Color(0xff156FD6),
            filled: true,
            prefixIcon:
                Icon(Icons.person, color: Colors.white, size: 20.0),
            hintText: 'Нэвтрэх нэр',
            hintStyle:
                TextStyle(fontWeight: FontWeight.w300, color: Colors.white,
                fontFamily: 'RobotoLight',
                ),
            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12.0),
              borderSide: const BorderSide(color: Colors.white, width: 1.0),
            ),
          ),
        ),
      ),
    );

    final password = Center(
      child: Container(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        child: TextField(
          style: new TextStyle(color: Colors.white, fontFamily: 'RobotoLight'),
          autofocus: false,
          controller:  edtPassController,
          cursorColor: Colors.white,
          obscureText: true,
          decoration: InputDecoration(
              fillColor: Color(0xff156FD6),
              filled: true,
              errorText: _validatePass ? 'Нууц үгээ оруулна уу' : null,
              errorStyle: TextStyle(
                color: Colors.red,
                fontFamily: 'RobotoLight',
              ),
              prefixIcon: Icon(Icons.lock_open, color: Colors.white, size: 20.0),
              hintText: 'Нууц үг',
              hintStyle: TextStyle(
                fontWeight: FontWeight.w300,
                color: Colors.white,
                fontFamily: 'RobotoLight',
              ),
              contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
              enabledBorder: OutlineInputBorder(
                borderSide: new BorderSide(color: Colors.white, width: 1.0),
                borderRadius: BorderRadius.circular(12.0),
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.0),
                  borderSide: new BorderSide(
                    color: Colors.white,
                    width: 1.0,
                  ))),
        ),
      ),
    );

    final input = Center(
      child: Container(
        width: screen_width,
        child: Material(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          elevation: 5.0,
          shadowColor: Colors.black,
          child: Container(
            decoration: BoxDecoration(
                color: widget.color,
                borderRadius: BorderRadius.circular(10.0),
                shape: BoxShape.rectangle,
                border: Border.all(color: widget.borderColor, width: 1.5)),
            child: Material(
              type: MaterialType.transparency,
              color: Colors.transparent,
              child: InkWell(
                splashColor: widget.splash,
                onTap: () {
                  print("Button clicked ");
                },
                borderRadius: BorderRadius.circular(10.0),
                child: Container(
                  padding: const EdgeInsets.all(15.0),
                  child: TextFormField(
                    autofocus: false,
                    initialValue: '',
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.accessibility,
                          color: Colors.white, size: 30.0),
                      hintText: 'Нэвтрэх нэр',
                      hintStyle: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                      ),
                      contentPadding:
                          EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(12.0),
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

    final loginBtn = Center(
      child: Container(
        padding: const EdgeInsets.only(left: 24.0, right: 24.0),
        width: MediaQuery.of(context).size.width,
        height: 50.0,
        child: RaisedButton(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          onPressed: () {
            print("Системд нэвтрэх");
            Navigator.push(context, MaterialPageRoute(builder: (context) => parentMain()));
          },
          color: Colors.orange[700],
          child: Text(
            'СИСТЕМД НЭВТРЭХ',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'RobotoLight',
              fontSize: 15.0,
            ),
          ),
        ),
      ),
    );

    final forgetLabel  = FlatButton(
      child: Text(
        'Нууц үг мартсан уу?',
        style: TextStyle(
          color: Colors.white,
          fontFamily: 'RobotoLight',
        ),
      ),
      onPressed: (){
        print("Нууц үг мартсан уу ?");
      },
    );



   final registerBtn = Center(
     child: Container(
       padding: const EdgeInsets.only(left: 24.0, right: 24.0),
       width: MediaQuery.of(context).size.width,
       height: 50.0,
       child: RaisedButton(
         shape: RoundedRectangleBorder(
           borderRadius: BorderRadius.circular(12.0),
         ),
         onPressed: (){
           print("Шинэ хэрэглэгч");
         },
         color: Color(0xff156FD6),
         child: Text(
             'ШИНЭ ХЭРЭГЛЭГЧ',
             style: TextStyle(
               color: Colors.white,
               fontFamily: 'RobotoLight',
               fontSize: 15.0,
             ),
         ),
       ),
     ),
   );

    return new Scaffold(
      body: new Stack(
        children: <Widget>[
          new Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new AssetImage("images/ic_board.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          new SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 10.0),
              child: new Row(
                children: <Widget>[
                  Expanded(
                    child: new Image.asset(
                      "images/ic_ministry.png",
                      fit: BoxFit.fitHeight,
                      height: 40.0,
                      alignment: AlignmentDirectional.centerStart,
                    ),
                  ),
                  Expanded(
                    child: new Image.asset(
                      "images/ic_esis.png",
                      fit: BoxFit.fitHeight,
                      height: 40.0,
                      alignment: AlignmentDirectional.centerEnd,
                    ),
                  ),
                ],
              ),
            ),
          ),
          new Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              email,
              SizedBox(
                height: 8.0,
              ),
              password,
              SizedBox(
                height: 20.0,
              ),
//              loginBtn,
              BtnConfirm(
                text: 'СИСТЕМД НЭВТРЭХ',
                textColor: Colors.white,
                borderColor: Colors.orange[700],
                splash: Colors.grey[350],
                color: Colors.orange[700],
                onPressed: (){
              /*    print("  Тавтай морилно уу ?");
                  print("  Хэрэглэгчийн нэр: " + edtEmailController.text);
                  print("  Нууц үг: " + edtPassController.text);*/

//                  postRequest();
//                  sendRequest();

                 Navigator.push(context, MaterialPageRoute(builder: (context) => parentMain()));


                  if(edtEmailController.text == "tserenbyamba" && edtPassController.text == "123"){
                    print("Welcome");
                    create();
                  } else{
                    print(" Хэрэглэгчийн нэр эсвэл нууц үг буруу байна. ");
                  }

                  setState(() {
                    edtEmailController.text.isEmpty ? _validateEmail = true : _validateEmail = false;
                    edtPassController.text.isEmpty ? _validatePass = true : _validatePass = false;
                  });

                  edtEmailController.text = "";
                  edtPassController.text = "";

                },
              ),
              SizedBox(
                height: 20.0,
              ),
              forgetLabel,
              SizedBox(
                height: 20.0,
              ),
//              registerBtn,

              BtnConfirm(
                text: 'ШИНЭ ХЭРЭГЛЭГЧ',
                textColor: Colors.white,
                onPressed: makeRequest,
                color: Color(0xff156FD6),
                borderColor: Color(0xff156FD6),
                splash: Colors.grey[350],
              ),

              SizedBox(
                height: 40.0,
              ),


            ],
          )
        ],
      ),
    );
  }
}

