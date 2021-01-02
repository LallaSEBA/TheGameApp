import 'package:flutter/material.dart';

class Great extends StatefulWidget {
  @override
  _Great createState() => _Great();
}

class _Great extends State<Great> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            backgroundColor: Colors.grey[300],
            body: Column(
              children: <Widget>[
                Container(padding: EdgeInsets.only(top:60),color: Colors.white,),
                Stack(
                  children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height/2,
                          child: TopBar(),
                        ),  
                       
                        Center(
                          child: Container(
                          height: MediaQuery.of(context).size.height-60,
                            padding: EdgeInsets.only(top:20, bottom: 60),
                            child: Column(                  
                                  children: <Widget>[                  
                                    Container(
                                              padding: EdgeInsets.all(10),
                                              child: Icon(Icons.thumb_up, size: 50, color:Colors.grey.shade600),
                                              decoration:BoxDecoration(
                                                  color: Colors.white,
                                                  border: new Border.all(
                                                      width: 1.25,
                                                      color:  Colors.grey),
                                                  borderRadius: const BorderRadius.all(const Radius.circular(100))
                                              )
                                              ),
                                   Padding(padding: EdgeInsets.only(top:50)),  
                                    Expanded(
                                      child: Column(
                                        children: <Widget>[
                                          Text( "عمل رائع",
                                            textAlign: TextAlign.center,
                                              style:TextStyle(
                                                fontSize:  43,
                                                fontWeight: FontWeight.bold,
                                                color: Color.fromRGBO(111, 111, 111, 1),
                                              ),
                                          ), 
                                      Text( "تمت الإجابة على الطلب \n عد إلى الصفحة الرئيسة للرد على طلب آخر",
                                        textAlign: TextAlign.center,
                                          style:TextStyle(
                                            height: 1.6 ,
                                            fontSize:  15,
                                            fontWeight: FontWeight.bold,
                                            color: Color.fromRGBO(111, 111, 111, 1),
                                          ),
                                      ),
                                      Padding(padding: EdgeInsets.only(top:50)),       
                                      Container(
                                                width: MediaQuery.of(context).size.width/2,
                                                height: 50,
                                                child: RaisedButton(
                                                  color: Color.fromRGBO(174, 174, 174, 1),
                                                  elevation: 0,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(100),
                                                    side:BorderSide(color: Color.fromRGBO(174, 174, 174, 1),)
                                                  ),
                                                  child: Text ("عد إلى الصفحة الرئيسية", 
                                                        textAlign: TextAlign.center,
                                                          style:TextStyle(
                                                            fontSize: 12,
                                                            color: Colors.white
                                                          ),
                                                        ),
                                                  onPressed: (){},
                                                ),
                                              ),
                                        ],
                                      ),
                                    )
                              ],
                            ),
                          ),
                        ),              
                  ],
                ),
              ],
            ),
      
    );
  }
}
class TopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      child: Container(
        height: 300.0,
      ),
      painter: CurvePainter(),
    );
  }
}
class CurvePainter extends CustomPainter{
  @override
  void paint(Canvas canvas, Size size) {
  Path path = Path();
  Paint paint = Paint();
  path.lineTo(0, size.height*0.5);
  path.quadraticBezierTo(size.width*0.1, size.height, size.width*0.3, size.height*0.75);

  path.quadraticBezierTo(size.width*0.6, size.height*0.4, size.width*0.8, size.height*0.7);
  path.quadraticBezierTo(size.width*0.95, size.height-10, size.width, size.height*0.85);
  path.lineTo(size.width, 0);
  path.close();

  paint.color = Colors.white;
  canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}


/*

*/