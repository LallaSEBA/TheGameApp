import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/shackwa.dart';
import 'screens/shackwadmin.dart';
import 'screens/forgotpsswd.dart';
import 'screens/resetpwd.dart';
import 'screens/account.dart';
import 'screens/accountadmin.dart';
import 'screens/complainpage.dart';
import 'screens/notifications.dart';
import 'ressources/strings.dart';
import 'screens/fillup.dart';
import 'screens/home.dart';
import 'screens/login.dart';
import 'screens/loginadmin.dart';
import 'screens/signup.dart';
import 'screens/verify%20_your_account.dart';
import 'screens/done.dart';
import 'controller/user_controller.dart';

    
var pgHome;
void main() async{    
    WidgetsFlutterBinding.ensureInitialized();
    var db = UserController();
    final prefs =  await SharedPreferences.getInstance();
     if(prefs.containsKey('ch_token')&& prefs.getString('ch_token')!=null && prefs.getString('ch_token')!='' && prefs.getBool('isAdmin')!=null)
     {
       var isAdmin = prefs.getBool('isAdmin');
       UserController.user.setToken = prefs.getString('ch_token');
       var status=await db.getData(isAdmin);
       if (status) pgHome = prefs.getBool('isAdmin')? Home(isAdmin:true):Home(isAdmin:false);
       else pgHome = LoginPage();
     }
     else pgHome = LoginPage();

   runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:pgHome,
      routes: {
       '/signUp'     : (BuildContext context)=>SignUp(),
       '/fillUp'     : (BuildContext context)=>Fillup(),
       '/login'      : (BuildContext context)=>LoginPage(),
       '/loginAdm'   : (BuildContext context)=>LoginAdminPage(),
       '/homeUser'   : (BuildContext context)=>Home(isAdmin:false),
       '/homeAdm'    : (BuildContext context)=>Home(isAdmin:true),
       '/youDidIt'   : (BuildContext context)=>Done(screenType:str_Congrat),
       '/greate'     : (BuildContext context)=>Done(screenType:str_Greate),
       '/done'       : (BuildContext context)=>Done(screenType:str_Received),
       '/notif'      : (BuildContext context)=>NotificationHome(),
       '/account'    : (BuildContext context)=>AccountPage(),
       '/accountAdm' : (BuildContext context)=>AccountAdminPage(),
       '/resetPwd'   : (BuildContext context)=>ResetPwd(),
       '/forgotPwd'  : (BuildContext context)=>ForgotPage(),
       '/verifyAcc'  : (BuildContext context)=>VerifyYourAccount(),
       '/shakwa'     :(BuildContext context)=> ShackwaPage(),
       '/shakwaAdm'  :(BuildContext context)=> ShackwaAdminPage(),
       '/complainAll'  :(BuildContext context)=> Complain(index: 3,),
       '/complainShak' :(BuildContext context)=> Complain(index: 2,),
       '/complainTha'  :(BuildContext context)=> Complain(index: 1,),
       '/complainIkt'  :(BuildContext context)=> Complain(index: 0,),
      },
    );  
  }
}
