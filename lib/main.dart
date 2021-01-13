import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/screens/fillup.dart';
import 'package:shaths_app_thegame/screens/home.dart';
import 'package:shaths_app_thegame/screens/login.dart';
import 'package:shaths_app_thegame/screens/loginadmin.dart';
import 'package:shaths_app_thegame/screens/signup.dart';
import 'screens/done.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:SignUp(),
      routes: {
       '/fillUp'   : (BuildContext context)=>Fillup(),
       '/login'    : (BuildContext context)=>LoginPage(),
       '/loginAdm' : (BuildContext context)=>LoginAdminPage(),
       '/homeUser' : (BuildContext context)=>Home(isAdmin:false),
       '/homeAdm'  : (BuildContext context)=>Home(isAdmin:true),
       '/done'     : (BuildContext context)=>Done(screenType:'youDidIt'),
      },
    );
  
  }
}
