import 'package:flutter/material.dart';

import 'const.dart';
import 'drawerAdm.dart';
import 'navigationBar.dart';

class VerifyYourAccount extends StatefulWidget {
  @override
  _VerifyYourAccountState createState() => _VerifyYourAccountState();
}

class _VerifyYourAccountState extends State<VerifyYourAccount> {
  
   var _id1  = TextEditingController();
   var _id2  = TextEditingController();
   var _id3  = TextEditingController();

 Widget digitField(TextEditingController controller){
   return  Container(
                width: 80,
                padding: EdgeInsets.only(left:20),
                child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
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
                      Text( 'أدخل رمز التحقق المرسل إلى حيابك الإلكتروني لتأكيد حسابك', 
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
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children:<Widget>[
                          digitField(_id1),
                          digitField(_id2),
                          digitField(_id3),
                        ]
                      ),
                    Padding(padding: EdgeInsets.only(bottom:50)),  
                    RaisedButton(
                      elevation: 5,
                      color: cBlue,
                      child: Text(
                        'إرسال',
                         style: TextStyle(color: cWhite, fontSize: 18),
                        ), 
                      onPressed: (){},)
              ]),
                ],
              ),
            ),
       //     ),
            
          );
        }
      
        drawerAdmin(BuildContext context) {}
}