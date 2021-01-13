import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import '../controller/db_manager.dart';
//import 'package:firstgameapp1/view/forgotpsswd.dart';

class LoginAdminPage extends StatefulWidget {
  LoginAdminPage({Key key}) : super(key: key);
  //final String title;

  @override
  LoginAdminPageState createState() => LoginAdminPageState();
}

class LoginAdminPageState extends State<LoginAdminPage> {
  final TextEditingController _email = new TextEditingController();
  final TextEditingController _password = new TextEditingController();

  var db = DBManager();

  bool valueCheck = false;

  void onChange(bool valeur) {
    setState(() {
      valueCheck = valeur;
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
              image: AssetImage('assets/image/u3.JPG'),
              fit: BoxFit.fill,
            ),
          ),
          padding:
              EdgeInsets.only(left: 23.0, top: 13.0, right: 23.0, bottom: 5.0),
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
                    textAlignVertical: TextAlignVertical.bottom,
                    controller: _email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(                      
                      prefixIcon: Padding( padding: const EdgeInsets.all(10,) , child: Image.asset("assets/image/email.png", width: 5, height: 5, fit: BoxFit.contain,),),
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
                      prefixIcon: Padding( padding: const EdgeInsets.all(10,) , child: Image.asset("assets/image/eye.png", width: 5, height: 5, fit: BoxFit.contain,),),
                    hintText: 'كلمة السر',
                    hintStyle: TextStyle(color: Color(0xffB9B9B9)),
                  ),
                ),
              ),

              Container(
                height: 30.0,
                child: new FlatButton(
                  onPressed: (){},
                  padding: const EdgeInsets.all(0),
                  // وضعت هنا لينك يأخد الى واجهة الفورجوت باسورد يشتغل عند نزع الكومنت ووضع لينك له في الماين

                  //onPressed: () =>
                      //Navigator.of(context).push(new MaterialPageRoute(
                   // builder: (BuildContext context) => new ForgotPage(),
                  //)),
                  child: new Stack(
                    children: <Widget>[
                      Align(
                        alignment: Alignment.centerLeft,
                        child: new Text(
                          'نسيت كلمة المرور؟',
                          textAlign: TextAlign.right,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xffFF771A),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 25.0),
              ),

              Container(
                child: new RaisedButton(
                  onPressed: () async{
                    db.loginData(_email.text, _password.text)
                    .then((response){
                      print('réponse $response');
                      });
                  },
                  color: Color(0xff4D7FFF),
                  child: new Text(
                    'تسجبل الدخول',
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
                        value: valueCheck,
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
                            'عد الى الصفحة الرئيسية',
                            style: new TextStyle(
                              color: Color(0xff4D7FFF),
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
                          padding: const EdgeInsets.all(0),
                          child: new Text(
                            "لست مسؤول؟  ",
                            style: new TextStyle(
                              color: Color(0xff333333),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          onPressed: (){},
                        ),
                      ),
                    ],
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
