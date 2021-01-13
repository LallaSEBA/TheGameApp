import 'package:flutter/material.dart';
import '../ressources/strings.dart';
import '../controller/db_manager.dart';
import '../ressources/const.dart';

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
     case str_Greate:{
      titleTxt   = str_Greate ;
      paragphTxt = str_txtGreate;
      btnTxt     = str_btnGreate;
      fntSize = 12;
      pdn = 30;
     }
     break;
     case str_Congrat:{
      titleTxt   = str_Congrat ;
      paragphTxt = str_txtCongrat;
      btnTxt     = str_continue;
      pdn = 60;
     }
     break;
     default :{
      titleTxt   = str_Received ;
      paragphTxt = str_txtReceived;
      btnTxt     = str_btnReceived;
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
                                                onPressed: () async{                                                  
                                                    switch  (screenType){
                                                      case str_Greate:{
                                                      //  titleTxt   = "عمل رائع" ;
                                                      var typeUser = await DBManager.isAdminToken();
                                                       typeUser ? Navigator.of(context).pushReplacementNamed('/homeUser'):
                                                                  Navigator.of(context).pushReplacementNamed('/homeAdm');
                                                      }
                                                      break;
                                                      case str_Congrat:{
                                                       // titleTxt   = "تهانينا" ;
                                                      }
                                                      break;
                                                      default :{
                                                        //titleTxt   = "تم الاستلام" ;
                                                      }
                                                      break;
                                                    }
                                                },
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