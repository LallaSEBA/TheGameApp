import 'package:flutter/material.dart';

import 'const.dart';

class Done extends StatelessWidget {
  final String screenType;

  String titleTxt;
  String paragphTxt;
  String btnTxt;
  double fntSize = 20;
  double pdn;

  Done( {Key key, this.screenType}) : super(key: key);

  void getVals() {
   
   switch  (screenType){
     case 'Done':{
      titleTxt   = "عمل رائع" ;
      paragphTxt =  "تمت الإجابة على الطلب \n عد إلى الصفحة الرئيسة للرد على طلب آخر";
      btnTxt     = "عد إلى الصفحة الرئيسية";
      fntSize = 12;
      pdn = 30;
     }
     break;
     case 'youDidIt':{
      titleTxt   = "تهانينا" ;
      paragphTxt =  "تم التسجيل بنجاح\nتستطيع الآن الاستمرار";
      btnTxt     = "استمر";
      pdn = 60;
     }
     break;
     default :{
      titleTxt   = "تم الاستلام" ;
      paragphTxt =  "تم استلام طلبك بنجاح. ستتلقى ردا في أقرب وقت";
      btnTxt     = "أرسل طلبا آخر";
      fntSize = 18;
      pdn = 40;
     }
     break;
   }
  }

  @override
  Widget build(BuildContext context) {
    getVals();
    return Scaffold(      
            body: Stack(
                  children: <Widget>[
                           Image.asset("assets/image/u2.JPG",fit:BoxFit.fitWidth , 
                                        width: MediaQuery.of(context).size.width,
                                        height: MediaQuery.of(context).size.height,),                       
                        Center(
                          child: Column(   
                                  mainAxisAlignment: MainAxisAlignment.center,                                                  
                                  children: <Widget>[          
                                  Column(
                                      children: <Widget>[
                                    Padding(padding: EdgeInsets.only(top:90)),    
                                        Text( titleTxt,
                                          textAlign: TextAlign.center,
                                            style:TextStyle(
                                              fontSize:  43,
                                              fontWeight: FontWeight.bold,
                                              color: cBlack,
                                            ),
                                        ), 
                                    Text(paragphTxt,
                                      textAlign: TextAlign.center,
                                        style:TextStyle(
                                          height: 1.6 ,
                                          fontSize:  15,
                                         // fontWeight: FontWeight.bold,
                                          color: cBlack,
                                        ),
                                    ),
                                    Padding(padding: EdgeInsets.only(top:40)),       
                                    Container(
                                              height: 45,
                                              child: RaisedButton(
                                              padding: EdgeInsets.only(left:pdn, right: pdn),
                                                color: cBlue,
                                                elevation: 0,
                                                shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(100),
                                                  side:BorderSide(color: cBlue),
                                                ),
                                                child: Text (btnTxt, 
                                                      textAlign: TextAlign.center,
                                                        style:TextStyle(
                                                          fontSize: fntSize,
                                                          color: cWhite
                                                        ),
                                                      ),
                                                onPressed: (){},
                                              ),
                                            ),
                                      ],
                                    ),
                              ],
                            ),
                          ),                              
                  ],
                ),      
    );
  }
}