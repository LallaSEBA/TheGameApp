//***********************************************************
//********************** Oum Maria **************************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart' as intl;
class ShackwaPage extends StatefulWidget {
  ShackwaPage({Key key}) : super(key: key);
  //final String title;

  @override
  ShackwaPageState createState() => ShackwaPageState();
}

class ShackwaPageState extends State<ShackwaPage> {
  String dropdownValue3 = 'نوع الطلب';
  String dropdownValue = 'القطاعات';

  // To show Selected Item to transfert it in database
  String sectors = '' ;
  String types = '';
  List <String> sectorsName = [
    'القطاعات',
    'الجمعيات',
    'الأسرة و الحماية',
    'سجل الجمعيات',
    'الأشحاص ذوي الاعاقة و مراكزها',
    'المكارم الملكية' ,
    'الاحداث و الأمن المجتمعي',
    'سوء تصرف موظف/مساعدات',
    'التطور المؤسسي',
    'عدم الاختصاص',
    'تعزيز الانتاجية',
    'وحدة التسول',
    'الموارد البشرىة تعيينات',
    'المساعدات',
    'متفرقات',
    'المساكن'
  ];
  List <String> typesName = [
  'نوع الطلب',
  'شكوى',
  'ثناء',
  'اقتراح'
];

  void getDropDownItem(){

    setState(() {
      sectors = dropdownValue ;
    });
  }


  void getDropDownItem1(){

    setState(() {
      types = dropdownValue ;
    });
  }




  final TextEditingController _nameUser = new TextEditingController();
  final TextEditingController _nationalId = new TextEditingController();
  final TextEditingController _addressUser = new TextEditingController();
  final TextEditingController _cityUser = new TextEditingController();
  final TextEditingController _userGovernorate = new TextEditingController();
  final TextEditingController _subject = new TextEditingController();
  final TextEditingController _detail = new TextEditingController();
  final TextEditingController _suggestion = new TextEditingController();
  DateTime _currentDate = new DateTime.now();
  @override
  Widget build(BuildContext context) {
    //هنا يجب عمل imoprt for the package intl
    String _formatDate = intl.DateFormat('yyyy/MM/dd').format(_currentDate);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shackwa',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
     //     toolbarHeight: 29.0,
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
              image: AssetImage('images/u6.jpg'),
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
                    child: new Text("$_formatDate:التاريخ  ",
                      textAlign: TextAlign.right,
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
                height: 35.0,
                child: new TextField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  textAlignVertical: TextAlignVertical.center,
                  controller: _nationalId,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                        //width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        //width: 2.0,
                      ),
                    ),
                    hintText: (' الرقم الوطني'),
                    hintStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff333333)),
                  ),
                ),
              ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 23.0),
              ),
              Card(
                elevation: 5,
              child: new Container(
                height: 35.0,
                child: new TextField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  controller: _nameUser,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                        //width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        //width: 2.0,
                      ),
                    ),
                    hintText: (' الاسم الكامل'),
                    hintStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff333333)),
                  ),
                ),
              ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 23.0),
              ),
              Card(
                elevation: 5,
              child: new Container(
                height: 35.0,
                child: new TextField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  controller: _addressUser,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                        //width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        //width: 2.0,
                      ),
                    ),
                    hintText: (' المنطقة'),
                    hintStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff333333)),
                  ),
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
                      height: 35.0,
                      width: 100.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        color: Color(0xffFFFFFF),
                      ),

                      child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        isExpanded: true,
                        value: dropdownValue,
                        icon: Icon(Icons.arrow_drop_down),
                        iconSize: 24,
                        iconEnabledColor: Colors.grey,
                        onChanged: (String newValue5) {
                          setState(() {
                            dropdownValue = newValue5;
                          });
                        },
                        items: sectorsName.map<DropdownMenuItem<String>>((String value5) {
                          return DropdownMenuItem<String>(
                            value: value5,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 9.0),
                            child: Text(
                              value5,
                              //textAlign: TextAlign.right,
                              //overflow: TextOverflow.ellipsis,
                              style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,
                                color: Color(0xff333333),
                              ),
                            ),
                            ),
                          );
                        }).toList(),

                      ),
                    ),
                    ),

                    ),
                  Card(
                    elevation: 5,
                 child:  new Container(
                    height: 35.0,
                    width: 100.0,

                    child: new TextField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      controller: _userGovernorate,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                          borderSide: BorderSide(
                            color: Color(0xffFFFFFF),
                            //width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                          borderSide: BorderSide(
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                          borderSide: BorderSide(
                            //width: 2.0,
                          ),
                        ),
                        hintText: (' المحافظة'),
                        hintStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff333333)),
                      ),
                    ),
                  ),
                  ),
                  Card(
                    elevation: 5,
                  child: new Container(
                    height: 35.0,
                    width: 100.0,
                    child: new TextField(
                      textDirection: TextDirection.rtl,
                      textAlign: TextAlign.right,
                      controller: _cityUser,
                      keyboardType: TextInputType.text,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: Color(0xffFFFFFF),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                          borderSide: BorderSide(
                            color: Color(0xffFFFFFF),
                            //width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                          borderSide: BorderSide(
                            color: Color(0xffFFFFFF),
                          ),
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                          borderSide: BorderSide(
                            //width: 2.0,
                          ),
                        ),
                        hintText: (' اللواء'),
                        hintStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff333333)),
                      ),
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
                    height: 35.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      color: Color(0xffFFFFFF),
                    ),
              child: DropdownButtonHideUnderline(
                child: DropdownButton<String>(
                  isExpanded: true,
                  value: dropdownValue3,
                  onChanged: (String newValue3) {
                    setState(() {
                      dropdownValue3 = newValue3;
                    });
                  },
                  items: typesName.map<DropdownMenuItem<String>>((String value3) {
                    return DropdownMenuItem<String>(
                      value: value3,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25.0),
                      child: Text(value3,
                        textAlign: TextAlign.center,
                          style: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold,
                            color: Color(0xff333333),
                          ),
                      ),
                      ),
                    );
                  }).toList(),
                  icon: Icon(Icons.arrow_drop_down),
                  iconSize: 21.0,
                  iconEnabledColor: Colors.grey,
                ),
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
                height: 35.0,
                width: 150.0,
                child: new TextField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  controller: _subject,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                        //width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        //width: 2.0,
                      ),
                    ),
                    hintText: (' الموضوع'),
                    hintStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff333333)),
                  ),
                ),
              ),
                  ),
              ],
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 23.0),
              ),
              Card(
                elevation: 5,
              child: new Container(
                height: 300.0,
                child: new TextField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right, 
                  maxLines: 250,
                  controller: _detail,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                        //width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        //width: 2.0,
                      ),
                    ),
                    hintText: ('التفاصيل'),
                    hintStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff333333)),
                  ),
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
                child: new TextField(
                  textDirection: TextDirection.rtl,
                  textAlign: TextAlign.right,
                  maxLines: 150,
                  controller: _suggestion,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Color(0xffFFFFFF),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                        //width: 2.0,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        color: Color(0xffFFFFFF),
                      ),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                      borderSide: BorderSide(
                        //width: 2.0,
                      ),
                    ),
                    hintText: ('ماهو اقتراحك لضمان عدم تكرار هذه الشكوى مستقبلا؟'),
                    hintStyle: TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold, color: Color(0xff333333)),
                  ),
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
                      'ارسال',
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
