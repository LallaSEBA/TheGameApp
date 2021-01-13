import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class Home2 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new homestate();
  }
}

class homestate extends State<Home2> {
  @override
  Widget build(BuildContext context) {
    return new Container(

       child:ListView.builder(
          padding: EdgeInsets.only(top:200.0),
          itemCount: 33,

          itemBuilder: (BuildContext context, int position) {
            return Container(
              child: new Center(
                child: new Column(
                  children: [
                    new Padding(padding: EdgeInsets.only(top:45.0)),
                    new Container(
                      height: 128,
                      width: 320.0,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                          color: Colors.white54,
                        ),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: new Row(
                          children: [
                            //new Padding(padding: EdgeInsets.only(top: 50.0,)),

                            new Container(
                              margin: EdgeInsets.only(left:9.0),
                              child: new Column(
                                children: [
                                  new Padding(
                                    padding: EdgeInsets.only(
                                      top: 4.0,
                                    ),
                                  ),
                                  new Container(
                                    alignment: Alignment.topRight,
                                    child: new Text(
                                      'time is',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        fontSize: 19.0,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  new Padding(padding: EdgeInsets.only(left: 14.0)),
                                  new FlatButton(
                                    onPressed: null,
                                    child: new Text(
                                      'نسخ',
                                    ),
                                  ),
                                  //new Padding(padding: EdgeInsets.only(top: 5.0),),
                                  new RaisedButton(
                                      onPressed: () {},
                                      color: Color(0xff4D7FFF),
                                      shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(35.0),
                                      ),
                                      child: Text('شكوى',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.w300,
                                            fontSize: 12.0,
                                          ))),
                                ],
                              ),
                            ),
                            new Padding(padding: EdgeInsets.only(right:48.89,top:9.0),),
                            new Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,

                              children: [
                                new Column(
                                  //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                    new Padding(padding: EdgeInsets.only(top:10.0),),
                                    new Container(

                                      margin:EdgeInsets.only(right:2.56,top:10.0),
                                      child: new Text('الاسم الكامل'),

                                    ),
                                    new Container(

                                      alignment: Alignment(0.80,-0.70),
                                      child: new Text('email@h.com'),

                                    ),




                                  ],),

                                new Padding(padding: EdgeInsets.only(right:10,top: 5.0),),

                                new Container(
                                  alignment: Alignment(0.70,-0.60),
                                  margin: EdgeInsets.only(left:6),
                                  color:Colors.white,
                                  child: CircleAvatar(
                                    radius: 30,
                                    backgroundColor: Colors.teal,
                                    child: CircleAvatar(
                                      backgroundImage: AssetImage('assets/image/u5.JPG'),
                                      radius:28.5,
                                    ),  ),   ),
                              ],),

                          ]),
                    )

                  ],
                ),
              ),
            );

          }),

    );



  }
}