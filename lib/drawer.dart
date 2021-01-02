import 'package:flutter/material.dart';

Widget myDrawer (BuildContext context ){
  var name  = "الاسم الكامل";
  var email = "البريد الإلكتروني";

   return Container(
           color: Colors.red,
           width: MediaQuery.of(context).size.width*0.75,
           child: Drawer (             
             child: Container(
               child: CustomPaint(
                        child: Container(
                          margin: EdgeInsets.only(right:50,bottom: MediaQuery.of(context).size.height*0.2),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: <Widget>[
                            
                              Padding(padding:EdgeInsets.only(top: 20)),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: <Widget>[
                                  CircleAvatar(
                                      radius: 27,
                                      //backgroundColor: Colors.grey,
                                      child: CircleAvatar(                                        
                                        backgroundColor: Colors.transparent,
                                        radius: 25,
                                        child:Icon(Icons.person, color: Colors.grey.shade900,)
                                      ),
                                    ),
                                  Padding(padding:EdgeInsets.only(top: 10)),
                                  Text(name, style: TextStyle(color: Colors.grey.shade800, fontSize: 23, fontWeight: FontWeight.bold),),
                                  Text(email, style: TextStyle(color: Colors.grey.shade900, fontSize: 16),)
                                ],
                              ),
                              Padding(padding:EdgeInsets.only(top: 10)),
                                Container(
                                  height: MediaQuery.of(context).size.height*0.4,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: <Widget>[
                                      FlatButton(padding:EdgeInsets.only(left:47), child: Text("الحساب", style: TextStyle(color: Colors.grey.shade900, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},),
                                      FlatButton(padding:EdgeInsets.only(left:50), child: Text("الإشعاراب", style: TextStyle(color: Colors.grey.shade900, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},),
                                      FlatButton(padding:EdgeInsets.only(left:60), child: Text("الطلب", style: TextStyle(color: Colors.grey.shade900, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},),
                                    
                                      Divider(
                                            color: Colors.grey.shade800,
                                            thickness: 3,
                                            indent:  MediaQuery.of(context).size.width*0.2,
                                            endIndent: 0,
                                          ),
                                      FlatButton(padding:EdgeInsets.only(left:50), child: Text("تسجيل الخروج", style: TextStyle(color: Colors.grey.shade900, fontSize: 15, fontWeight: FontWeight.bold),), onPressed: () {},),
                                    ],
                                  ),
                                ),
                              Padding(padding:EdgeInsets.only(top: 50)),
                            ],
                          ),
                        ),
                        painter: CurvePainter(),
                      )
             )
          ));
}

class CurvePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
  Path path = Path();
    Paint paint = Paint();
      path.lineTo(size.width, 0) ;
    path.lineTo(size.width, size.height/2) ;
    paint.color = Color.fromRGBO(224, 222,223, 1);
    canvas.drawPath(path, paint);
    path.close();

    
    path = Path();
    path.moveTo(size.width, size.height*0.5);
    path.lineTo(size.width, size.height) ;
   path.lineTo(size.width*0.4, size.height*0.7) ;
    paint.color = Colors.grey[800];
    canvas.drawPath(path, paint);
    path.close();
    
    path = Path();
    path.lineTo(0, size.height*0.4);
    path.lineTo(size.width*0.5, size.height*0.25) ;
    paint.color = Colors.grey[600];
    canvas.drawPath(path, paint);
    path.close();
    
    path = Path();
    path.moveTo(size.width*0.5, size.height*0.25);
    path.lineTo(size.width, size.height/2) ;
    path.lineTo(size.width*0.5, size.height*0.8);
    path.lineTo(0, size.height*0.4);

    paint.color = Color.fromRGBO(212, 212,212, 1);
    canvas.drawPath(path, paint);
    path.close();
    
    path = Path();
    path.moveTo(0, size.height*0.4);
    path.lineTo(size.width, size.height) ;
    path.lineTo(0, size.height) ;
    paint.color = Colors.grey[600];
    canvas.drawPath(path, paint);
    path.close();    
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    // TODO: implement shouldRepaint
    return oldDelegate != this;
  }
  
}
