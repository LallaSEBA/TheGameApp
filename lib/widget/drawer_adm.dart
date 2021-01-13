import 'package:flutter/material.dart';
import '../ressources/const.dart';
import 'package:shaths_app_thegame/ressources/strings.dart';

Widget drawerAdm (BuildContext context ){
  var name  = "الاسم الكامل";
  var admin = "المسؤول";

   return Container(          
           width: MediaQuery.of(context).size.width*0.5,
           child: Drawer (             
             child: SingleChildScrollView(
               child: Stack(
                 children: <Widget>[
                  Image.asset("assets/image/u5.JPG",fit:BoxFit.fitWidth,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*1.26,), 
                   Container(
                     height: MediaQuery.of(context).size.height,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: <Widget>[                       
                         Padding(padding:EdgeInsets.only(top: 35)),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: <Widget>[
                         Padding(padding:EdgeInsets.only(top: 5, left: 20)),
                         CircleAvatar(
                           radius: 27,
                           backgroundColor: cWhite,
                           child: CircleAvatar(                                        
                             backgroundColor: cOrange,
                             radius: 25,
                             child:Image.asset("assets/image/u10.png", width:45,),//Icon(Icons.person, size:40, color: cWhite,)
                           ),
                         ),
                             Text(name, style: TextStyle(color: cWhite, fontSize: 20, fontWeight: FontWeight.bold),),
                             Text(admin, style: TextStyle(color: cWhite, fontSize: 16),),
                           ],
                         ),
                         Padding(padding:EdgeInsets.only(top: 20)),
                           Container(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: <Widget>[
                                 ButtonTheme(height: 25, child:FlatButton(padding:EdgeInsets.only(left:47), child: Text(str_All, style: TextStyle(color: cBlack, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},)),
                                 ButtonTheme(height: 25, child:FlatButton(padding:EdgeInsets.only(left:50), child: Text(str_shakwa, style: TextStyle(color: cBlack, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},)),
                                 ButtonTheme(height: 25, child:FlatButton(padding:EdgeInsets.only(left:60), child: Text(str_thana, style: TextStyle(color: cBlack, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},)),
                                 ButtonTheme(height: 25, child:FlatButton(padding:EdgeInsets.only(left:15), child: Text(str_iktirah, style: TextStyle(color: cBlack, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},)),
                                 
                               /*
                                 Divider(
                                       color: cGreyL,
                                       thickness: 3,
                                       indent:  MediaQuery.of(context).size.width*0.2,
                                       endIndent: 0,
                                     ),*/
                               ],
                             ),
                           ),
                          Padding(padding:EdgeInsets.only(top: 20)),
                          FlatButton(padding:EdgeInsets.only(left:50), child: Text(str_exit, style: TextStyle(color:cBlack, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},),
                       ],
                     ),
                   ),
                 ],
               ),
             )
          ));
}




/*import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/const.dart';

Widget drawerUser (BuildContext context ){
  var name  = "الاسم الكامل";
  var email = "البريد الإلكتروني";

   return Container(          
           width: MediaQuery.of(context).size.width*0.5,
           child: Drawer (             
             child: SingleChildScrollView(
               child: Stack(
                 children: <Widget>[
                  Image.asset("assets/image/u5.JPG",fit:BoxFit.fill,
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height*1.4,), 
                   Container(
                     height: MediaQuery.of(context).size.height,
                     child: Column(
                       crossAxisAlignment: CrossAxisAlignment.end,
                       children: <Widget>[                       
                         Padding(padding:EdgeInsets.only(top: 35)),
                         Column(
                           crossAxisAlignment: CrossAxisAlignment.end,
                           children: <Widget>[
                         Padding(padding:EdgeInsets.only(top: 5, left: 20)),
                         CircleAvatar(
                           radius: 27,
                           backgroundColor: cWhite,
                           child: CircleAvatar(                                        
                             backgroundColor: cOrange,
                             radius: 25,
                             child:Image.asset("assets/image/u10.png", width:45,),//Icon(Icons.person, size:40, color: cWhite,)
                           ),
                         ),
                             Text(name, style: TextStyle(color: cWhite, fontSize: 20, fontWeight: FontWeight.bold),),
                             Text(email, style: TextStyle(color: cWhite, fontSize: 16),),
                           ],
                         ),
                         Padding(padding:EdgeInsets.only(top: 20)),
                           Container(
                             child: Column(
                               crossAxisAlignment: CrossAxisAlignment.end,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: <Widget>[
                                 FlatButton(padding:EdgeInsets.only(left:47), child: Text("الحساب", style: TextStyle(color: cBlack, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},),
                                 FlatButton(padding:EdgeInsets.only(left:50), child: Text("الإشعاراب", style: TextStyle(color: cBlack, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},),
                                 FlatButton(padding:EdgeInsets.only(left:60), child: Text("الطلب", style: TextStyle(color: cBlack, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},),
                               /*
                                 Divider(
                                       color: cGreyL,
                                       thickness: 3,
                                       indent:  MediaQuery.of(context).size.width*0.2,
                                       endIndent: 0,
                                     ),*/
                               ],
                             ),
                           ),
                          Padding(padding:EdgeInsets.only(top: 20)),
                          FlatButton(padding:EdgeInsets.only(left:50), child: Text("تسجيل الخروج", style: TextStyle(color:cBlack, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},),
                       ],
                     ),
                   ),
                 ],
               ),
             )
          ));
}
*/