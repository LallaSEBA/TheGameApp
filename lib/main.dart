import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/screens/complainpage.dart';
import 'ressources/strings.dart';
import 'package:shaths_app_thegame/screens/fillup.dart';
import 'package:shaths_app_thegame/screens/home.dart';
import 'package:shaths_app_thegame/screens/loginadm.dart';
import 'package:shaths_app_thegame/screens/login.dart';
import 'package:shaths_app_thegame/screens/signup.dart';
import 'package:shaths_app_thegame/screens/verify%20_your_account.dart';
import 'screens/done.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:LoginPage(),
      routes: {
       '/signUp'   : (BuildContext context)=>SignUp(),
       '/fillUp'   : (BuildContext context)=>Fillup(),
       '/login'    : (BuildContext context)=>LoginPage(),
       '/loginAdm' : (BuildContext context)=>LoginAdminPage(),
       '/homeUser' : (BuildContext context)=>Home(isAdmin:false),
       '/homeAdm'  : (BuildContext context)=>Home(isAdmin:true),
       '/youDidIt' : (BuildContext context)=>Done(screenType:str_Congrat),
       '/greate'   : (BuildContext context)=>Done(screenType:str_Greate),
       '/done'     : (BuildContext context)=>Done(screenType:str_Received),
      },
    );  
  }
}
