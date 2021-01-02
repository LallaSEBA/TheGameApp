import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/received.dart';

import 'drawer.dart';

class VerifyYourAccount extends StatefulWidget {
  @override
  _VerifyYourAccountState createState() => _VerifyYourAccountState();
}

class _VerifyYourAccountState extends State<VerifyYourAccount> {
 Widget digitField(){
   return  Container(
                width: 80,
                padding: EdgeInsets.only(left:20),
                child: TextField(
                  decoration: InputDecoration(
                    focusedBorder:UnderlineInputBorder(                                            
                      borderSide: BorderSide( color:Colors.grey.shade600, width: 2)
                    ),
                    enabledBorder:UnderlineInputBorder(                                            
                      borderSide: BorderSide( color:Colors.grey.shade600, width: 2)
                    ),
                    disabledBorder:UnderlineInputBorder(                                            
                      borderSide: BorderSide( color:Colors.grey.shade600, width: 2)
                    )
                  ),
              ),
            );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.red),
      endDrawer:  myDrawer(context),
      backgroundColor: Colors.white,
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Text( 'Verify Your Account', 
                    textAlign: TextAlign.center,
                      style:TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        color:Colors.grey.shade600,
                      ),
                    ),
              Padding(padding: EdgeInsets.only(bottom:15)),  
              Text( 'We just sent a Three digit code to your email \n Enter the code below to confirm your account', 
                    textAlign: TextAlign.center,
                      style:TextStyle(
                        fontSize: 12,
                        color:Colors.grey,
                        height: 1.5
                      ),
                    ),
              Padding(padding: EdgeInsets.only(bottom:50)),  
              Text( 'Activation Code', 
                    textAlign: TextAlign.center,
                      style:TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                        color:Colors.grey.shade600,
                      ),
                    ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children:<Widget>[
                  digitField(),
                  digitField(),
                  digitField(),
                ]
              ),
            Padding(padding: EdgeInsets.only(bottom:30)),  
            RaisedButton(
              color: Color.fromRGBO(174, 174, 174, 1),
              child: Text(
                'Send',
                 style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                ), 
              onPressed: (){},)
      ]),
        ),
 //     ),
      
    );
  }
}