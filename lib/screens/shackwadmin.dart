import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
class ShackwaAdminPage extends StatefulWidget {
  ShackwaAdminPage({Key key}) : super(key: key);
  //final String title;

  @override
  ShackwaAdminPageState createState() => ShackwaAdminPageState();
}

class ShackwaAdminPageState extends State<ShackwaAdminPage> {

  DateTime _currentDate = new DateTime.now();

  @override
  Widget build(BuildContext context) {
    //هنا يجب عمل imoprt for the package intl
    String _formatDate = intl.DateFormat('yyyy/MM/dd').format(_currentDate);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shackwadmin',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
        //  toolbarHeight: 29.0,
          backgroundColor: Colors.transparent,
          elevation: 0,
          actions: <Widget>[
            new IconButton(
                icon: new Icon(Icons.menu),
                onPressed: () {}
            ),
          ],
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/u6.JPG'),
              fit: BoxFit.fill,
            ),
          ),
          padding:
          EdgeInsets.only(top: 35.0, left: 23.0, right: 23.0, bottom: 12.0),
          child: new ListView(
            children: <Widget>[
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 25.0,
                      width: 120.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        color: Color(0xffFFFFFF),
                      ),
                      child: new Text("$_formatDate :التاريخ  ",
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xff333333)),
                      ),
                    ),
                  ),
                ],
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 43.0),
              ),
              Card(
                elevation: 5,
                child: new Container(
                  height: 25.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    color: Color(0xffFFFFFF),
                  ),
                  //هنا سيتم وضع الرقم الوطني المسترجع من ال databse
                  child: new Text(" الرقم الوطني",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xff333333)),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 23.0),
              ),
              Card(
                elevation: 5,
                child: new Container(
                  height: 25.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    color: Color(0xffFFFFFF),
                  ),
                  child: new Text("الاسم الكامل",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xff333333)),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 23.0),
              ),
              Card(
                elevation: 5,
                child: new Container(
                  height: 25.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    color: Color(0xffFFFFFF),
                  ),
                  child: new Text("المنطقة",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xff333333)),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 23.0),
              ),
              new Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  //القطاعات
                  Card(
                    elevation: 5,
                    child: Container(
                      height: 25.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        color: Color(0xffFFFFFF),
                      ),
                      child: new Text("القطاعات",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xff333333)),
                      ),
                    ),

                  ),
                  Card(
                    elevation: 5,
                    child:  new Container(
                      height: 25.0,
                      width: 100.0,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        color: Color(0xffFFFFFF),
                      ),
                      child: new Text("المحافظة",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xff333333)),
                      ),
                    ),
                  ),
                  Card(
                    elevation: 5,
                    child: new Container(
                      height: 25.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        color: Color(0xffFFFFFF),
                      ),
                      child: new Text("اللواء",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xff333333)),
                      ),
                    ),
                  ),
                ],
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 23.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    //نوع الطلب
                    child: Container(
                      height: 25.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        color: Color(0xffFFFFFF),
                      ),
                      child: new Text("شكوى",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xff333333)),
                      ),
                    ),
                  ),
                ],
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 15.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: <Widget>[
                  Card(
                    elevation: 5,
                    child: new Container(
                      height: 25.0,
                      width: 150.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        color: Color(0xffFFFFFF),
                      ),
                      child: new Text("الموضوع",
                        textAlign: TextAlign.right,
                        style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xff333333)),
                      ),
                    ),
                  ),
                ],
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 35.0),
              ),
              Card(
                elevation: 5,
                child: new Container(
                  height: 300.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    color: Color(0xffFFFFFF),
                  ),
                  //هنا سبتم عرض تفاصيل الشكوى
                  child: new Text(":التفاصيل",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xff333333)),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 23.0),
              ),
              Card(
                elevation: 5,
                child: new Container(
                  height: 150.0,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    color: Color(0xffFFFFFF),
                  ),
                  //هنا سيتم عرض الاقتراح
                  child: new Text(":الاقتراح",
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,  color: Color(0xff333333)),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 25.0),
              ),
              Column(
                children: <Widget>[
                  new RaisedButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18.0),
                        side: BorderSide(color: Color(0xff4D7FFF))),

                    onPressed: () {},
                    color: Color(0xff4D7FFF),
                    child: new Text(
                      'تم الرد',
                      style: new TextStyle(
                          fontSize: 15.0,
                          color: Color(0xffFFFFFF),
                          backgroundColor: Color(0xff4D7FFF)),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
