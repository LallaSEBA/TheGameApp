import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:shaths_app_thegame/ressources/const.dart';
import '../controller/user_controller.dart';
//import 'package:firstgameapp1/view/forgotpsswd.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);
  //final String title;

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  String msgError = '';
  
  var db = UserController();

  bool valueCheck1 = false;

  void onChange(bool valeur) {
    setState(() {
      valueCheck1 = valeur;
    });
  }

  @override
  Widget build(BuildContext context) {
    return /*MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Login',
      home:*/ Scaffold(
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/u3.JPG'),
              fit: BoxFit.fill,
            ),
          ),
          padding:
          EdgeInsets.only(left: 23.0, top: 15.0, right: 23.0, bottom: 5.0),
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
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      prefixIcon:Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset("assets/image/email.png", width: 5, height: 5, fit: BoxFit.contain,),
                                ),
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
                  controller: _password,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    prefixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset("assets/image/eye.png", width: 5, height: 5, fit: BoxFit.contain,),
                                ),
                    hintText: 'كلمة السر',
                    hintStyle: TextStyle(color: Color(0xffB9B9B9)),
                  ),
                ),
              ),
              Container(
                height: 30.0,
                child: new FlatButton(
                  onPressed: (){Navigator.of(context).pushNamed('/forgotPwd');},
                  padding: const EdgeInsets.only(top:5),
                  child: Align(
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          'نسيت كلمة المرور؟',
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: cOrange,
                          ),
                        ),
                      ),                  
              )),
              new Padding(
                padding: new EdgeInsets.only(top: 8.0),
              ),
              
              Center(child: Text(msgError, style: TextStyle(color: cOrange, fontSize: 13, fontWeight: FontWeight.bold, height: 2),)),
              Container(
                child: new RaisedButton(
                  onPressed: () async{
                    if(_password.text.trim()==''||_email.text.trim()=='') 
                            setState(() {
                              msgError = 'رجاء املء معلوماتك لتسجل الدخول';
                            });
                            else 
                            {
                              setState(() {
                                    msgError = '';
                              });
                              var response = await db.loginData(_email.text,_password.text,valueCheck1, false);//lalla@seba_123.com
                              print('response register: ${response}');
                              if(response) Navigator.of(context).pushNamed('/homeUser');
                              else setState(() {
                                msgError = db.rsponseMsg.replaceAll('{','').replaceAll('[','');
                                msgError = msgError.replaceAll('}','').replaceAll(']','');
                              });
                            }
                  },
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
                padding: new EdgeInsets.only(top: 8.0),
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
                          padding: const EdgeInsets.all(0),
                          child: FlatButton(
                            child: new Text(
                              'قم بانشاء حساب جديد',
                              style: new TextStyle(
                                color: Color(0xffFF771A),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            onPressed: ()=>Navigator.of(context).pushNamed('/signUp'),
                          ),
                        ),
                      ),
                      Container(
                        height: 18.0,
                        margin: const EdgeInsets.all(0),
                        padding: const EdgeInsets.all(0),
                      /*  child: new FlatButton(
                          onPressed: (){Navigator.of(context).pushNamed('/signUp');},
                          padding: const EdgeInsets.all(0),
                         */ child: new Text(
                            "لاتملك حساب؟  ",
                            style: new TextStyle(
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        //),
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
                  FlatButton(
                    child: new Text(
                      'مسؤول',
                      style: new TextStyle(
                        color: Color(0xff4D7FFF),
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                      ),
                    ), onPressed: () {Navigator.of(context).pushNamed('/loginAdm');},
                  ),
                ],
              ),
            ],
          ),
        ),
      //),
    );
  }
}
