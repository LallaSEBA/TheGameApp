import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/received.dart';

import 'drawer.dart';

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
      appBar: AppBar(backgroundColor: Colors.white, 
                     elevation:0,
                     iconTheme: IconThemeData(color: Colors.grey.shade600),),
      endDrawer:  myDrawer(context,),

      backgroundColor: Colors.white,
      body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children:<Widget>[
              Text( 'التحقق من حسابك', 
                    textAlign: TextAlign.center,
                      style:TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color:Colors.grey.shade600,
                      ),
                    ),
              Padding(padding: EdgeInsets.only(bottom:15)),  
              Text( 'قمنا بإرسال 3 رموز لبريدك، قم بإدخالها لتتحقق', 
                    textAlign: TextAlign.center,
                      style:TextStyle(
                        fontSize: 12,
                        color:Colors.grey,
                        height: 1.5
                      ),
                    ),
              Padding(padding: EdgeInsets.only(bottom:50)),  
              Text( 'رمز التحقق', 
                    textAlign: TextAlign.center,
                      style:TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color:Colors.grey.shade600,
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
            Padding(padding: EdgeInsets.only(bottom:30)),  
            RaisedButton(
              color: Color.fromRGBO(174, 174, 174, 1),
              child: Text(
                'إرسال',
                 style: TextStyle(color: Colors.grey.shade600, fontSize: 18),
                ), 
              onPressed: (){},)
      ]),
        ),
 //     ),
      
    );
  }
}