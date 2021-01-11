import 'package:flutter/material.dart';

class ForgotPage extends StatefulWidget {
  //ForgotPage({Key key}) : super(key: key);
  //final String title;

  @override
  ForgotPageState createState() => ForgotPageState();
}

class ForgotPageState extends State<ForgotPage> {
  final TextEditingController _forgotpsswd = new TextEditingController();

  // هذه الفاكشن سنصنعها فيما بعد لنرسل لينك لعمل ريزات للباسود شنناديها في ريزات بوتن
  void onPressedForgot() {}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Forgot Password',
      home: Scaffold(
        //appBar: AppBar(
        //title: Text(''),
        //backgroundColor: Colors.white,
        //elevation: 0,
        //),
        body: Container(
            constraints: BoxConstraints.expand(),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('images/u8.jpg'),
                fit: BoxFit.fill,
              ),
            ),
            padding: EdgeInsets.only(
                left: 18.0, top: 150.0, right: 18.0, bottom: 12.0),
            child: ListView(children: <Widget>[
              Container(
                height: 50,
                child: new Text(
                  'نسيت كلمة السر؟',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 25.0,
                    color: Color(0xff2E3675),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Container(
                height: 30,
                child: new Text(
                  "قم بادخال بريدك, لنرسل لك رابط لضبط كلمة المرور",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xff000000),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 75.0),
              ),
              Container(
                height: 30,
                child: new TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    textAlignVertical: TextAlignVertical.center,
                    controller: _forgotpsswd,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      hintText: 'البريد الالكتروني',
                    )),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 53.0),
              ),
              Column(children: <Widget>[
                new RaisedButton(
                  onPressed: () {},
                  color: Color(0xff4D7FFF),
                  child: new Text(
                    'أرسل',
                    style: new TextStyle(
                        fontSize: 15.0,
                        color: Color(0xffFFFFFF),
                        backgroundColor: Color(0xff4D7FFF)),
                  ),
                ),
              ]),
            ])),
      ),
    );
  }
}
