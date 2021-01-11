import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/widget/drawer_user.dart';

import '../controller/const.dart';
import '../widget/drawer_adm.dart';
import '../widget/navigationBar.dart';

class VerifyYourAccount extends StatelessWidget {
  
   var _id1  = TextEditingController();
   var _id2  = TextEditingController();
   var _id3  = TextEditingController();

 Widget digitField(TextEditingController controller){
   return  Container(
              //  width: 220,
                padding: EdgeInsets.only(left:20, right: 20),
                child: TextField(
                  controller: controller,
                  textAlign: TextAlign.center,
                  textAlignVertical: TextAlignVertical.center,
                 // maxLength: 1,
                  cursorColor: Colors.transparent,
                  decoration: InputDecoration(
                    counterText: "",
                    focusedBorder:UnderlineInputBorder(                                            
                      borderSide: BorderSide( color:cGreyL, width: 2)
                    ),
                    enabledBorder:UnderlineInputBorder(                                            
                      borderSide: BorderSide( color:cGreyL, width: 2)
                    ),
                    disabledBorder:UnderlineInputBorder(                                            
                      borderSide: BorderSide( color:cGreyL, width: 2)
                    )
                  ),
              ),
            );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Image.asset("assets/image/u4.JPG",fit:BoxFit.fitWidth , 
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height,), 
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children:<Widget>[
                      Padding(padding: EdgeInsets.only(bottom:140)), 
                      Text( 'أكد حسابك', 
                            textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize: 25,
                                fontWeight: FontWeight.bold,
                                color: cBlueD,
                              ),
                            ),
                      Padding(padding: EdgeInsets.only(bottom:10)),  
                      Text( 'أدخل رمز التحقق المرسل إلى حسابك الإلكتروني لتأكيد حسابك', 
                            textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize: 12,
                                color: cBlack,
                                height: 1.5,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                      Padding(padding: EdgeInsets.only(bottom:60)),  
                      Text( 'رمز التحقق', 
                            textAlign: TextAlign.center,
                              style:TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color:cBlack,
                              ),
                            ),
                     /* Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[*/
                          digitField(_id1),
                         // digitField(_id2),
                         // digitField(_id3),
                   //     ]
                     // ),
                    Padding(padding: EdgeInsets.only(bottom:50)),  
                    RaisedButton(
                      elevation: 5,
                      color: cBlue,
                      child: Text(
                        'إرسال',
                         style: TextStyle(color: cWhite, fontSize: 18),
                        ), 
                      onPressed: (){
                        print("digit1: ${_id1.text}, ${_id2.text}, ${_id3.text}");
                      },)
              ]),
                ],
              ),
            ),
       //     ),
            
          );
        }
}