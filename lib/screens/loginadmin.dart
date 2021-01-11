//************************************************
// **************** OUM MARIA ********************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class LoginAdminPage extends StatefulWidget {
  LoginAdminPage({Key key}) : super(key: key);
  //final String title;

  @override
  LoginAdminPageState createState() => LoginAdminPageState();
}

class LoginAdminPageState extends State<LoginAdminPage> {
  final TextEditingController _emailAdmin = new TextEditingController();
  final TextEditingController _passwordAdmin = new TextEditingController();

  bool valueCheck1 = false;

  void onChange(bool valeur) {
    setState(() {
      valueCheck1 = valeur;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home: Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/u3.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          padding:
          EdgeInsets.only(left: 23.0, top: 25.0, right: 23.0, bottom: 5.0),
          child: ListView(
            children: <Widget>[
              Container(
                height: 50.0,
                child: new Text(
                  'مرحبا',
                  style: TextStyle(
                    fontSize: 35.0,
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),

              Container(
                height: 30.0,
                child: new Text(
                  'قم بتسجيل الدخول لحسابك',
                  style: TextStyle(
                    fontSize: 15.0,
                    color: Color(0xffFFFFFF),
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.right,
                ),
              ),

              new Padding(
                padding: new EdgeInsets.only(top: 52.0),
              ),
              Container(
                height: 50.0,
                child: new TextField(
                    textDirection: TextDirection.rtl,
                    textAlign: TextAlign.right,
                    textAlignVertical: TextAlignVertical.center,
                    controller: _emailAdmin,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon:
                      new Icon(Icons.email, color: Color(0xffB9B9B9), size: 23.0),
                      hintText: 'البريد الالكتروني',
                      hintStyle: TextStyle(color: Color(0xffB9B9B9),),
                    )),
              ),

              new Padding(
                padding: new EdgeInsets.only(top: 9.0),
              ),
              Container(
                height: 50.0,
                child: new TextField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  controller: _passwordAdmin,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: new Icon(Icons.remove_red_eye,
                        color: Color(0xffB9B9B9), size: 23.0),
                    hintText: 'كلمة السر',
                    hintStyle: TextStyle(color: Color(0xffB9B9B9)),
                  ),
                ),
              ),


              new Padding(
                padding: new EdgeInsets.only(top: 52.0),
              ),

              Container(
                child: new RaisedButton(
                  onPressed: () {},
                  color: Color(0xff4D7FFF),
                  child: new Text(
                    'تسجيل الدخول',
                    style: new TextStyle(
                        fontSize: 19.0,
                        color: Color(0xffFFFFFF),
                        fontWeight: FontWeight.bold,
                        backgroundColor: Color(0xff4D7FFF)),
                  ),
                ),
              ),

              new Padding(
                padding: new EdgeInsets.only(top: 9.0),
              ),

              Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    new Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        new Text(
                          'ابقنى متصل',
                          style: new TextStyle(
                            color: Color(0xff000000),
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        Checkbox(
                            value: valueCheck1,
                            onChanged: onChange,
                            activeColor: Colors.black),
                      ],
                    ),
                  ]),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  new Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        height: 18.0,
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.all(0),
                        child: new FlatButton(
                          onPressed: (){},
                          padding: const EdgeInsets.all(0),
                          //هنا نضع اللينك لانشاء حساب
                          //onPressed: ()=>Navigator.of(context).push(
                          //  new MaterialPageRoute(
                          //  builder: (BuildContext context) => new RegisterPage(),
                          //)
                          //),

                          child: new Text(
                            'قم بانشاء حساب جديد',
                            style: new TextStyle(
                              color: Color(0xffFF771A),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 18.0,
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.all(0),
                        child: new FlatButton(
                          onPressed: (){},
                          padding: const EdgeInsets.all(0),
                          child: new Text(
                            "لاتملك حساب؟  ",
                            style: new TextStyle(
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 63.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  new Text(
                    'مسؤول',
                    style: new TextStyle(
                      color: Color(0xff4D7FFF),
                      fontWeight: FontWeight.w700,
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
