import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/widget/navigationBar.dart';
import 'package:shaths_app_thegame/controller/user_controller.dart';
import 'package:intl/intl.dart';
import 'package:shaths_app_thegame/screens/done.dart';

class Myhome extends StatefulWidget {
  DetailsHome createState() => DetailsHome();
}

class DetailsHome extends State<Myhome> {
 
    UserController db = new UserController();
  
  String now = DateFormat("yyyy/MM/dd").format(DateTime.now());


  /// اللواء
  static const List<String> lItems = const [
    'اللواء',
    'اللواء 1',
    'اللواء 2',
    'اللواء 3',
  ];

  String lValue = lItems[0];

  ///المحافظة
  static const List<String> mItems = const [
    'المحافظة',
    'المحافظة 1 ',
    'المحافظة 2',
    'المحافظة 3',
  ];

  String mValue = mItems[0];

  ///القطاعات
  static const List<String> sectionItems = const [
    'القطاعات',
    'الجمعيات',
    'الأسرة و الحماية',
    'سجل الجمعيات',
    'الأشحاص ذوي الاعاقة و مراكزها',
    'المكارم الملكية',
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

  String sectionValue = sectionItems[0];

  /// type
  static const List<String> typeItems = const [
    'نوع الطلب',
    'شكوى',
    'ثناء',
    'اقتراح',
  ];

  String typeValue = typeItems[0];
  
  
  final TextEditingController _numberController = new TextEditingController();
  final TextEditingController _subjectController = new TextEditingController();
  final TextEditingController _localController = new TextEditingController();
  final TextEditingController _nameController = new TextEditingController();
  TextEditingController _sectionController = new TextEditingController();
  TextEditingController _typeController = new TextEditingController();
  TextEditingController _mController = new TextEditingController(); //المحافظة
  TextEditingController _lController = new TextEditingController(); //اللواء
  final TextEditingController _detailsController = new TextEditingController();
  final TextEditingController _suggestionController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/u6.JPG'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),

                Padding(
                  padding: EdgeInsets.only(
                      top: 90.0, bottom: 5.0, left: 20.0, right: 20.0),
                  child: Column(
                    // mainAxisAlignment: MainAxisAlignment.center,
                    // crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        height: 50.0,
                        margin: EdgeInsets.only(bottom: 30.0, top: 25.0),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: IntrinsicWidth(
                              child: IntrinsicHeight(
                                child: TextFormField(
                                  keyboardType: TextInputType.text,
                                  autofocus: false,
                                  textAlign: TextAlign.right,
                                  decoration: InputDecoration(
                                      hintText: ' التاريخ : $now',
                                      hintStyle: TextStyle(fontSize: 14),
                                      contentPadding: EdgeInsets.fromLTRB(
                                          20.0, 5.0, 20.0, 5.0),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10.0)),
                                      fillColor: Color(0xffF3F3F3),
                                      filled: true),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.0,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Align(
                            alignment: Alignment.topRight,
                            child: TextFormField(
                           controller: _numberController,
                              keyboardType: TextInputType.text,
                              autofocus: false,
                              textAlign: TextAlign.right,
                              decoration: InputDecoration(
                                  hintText: ' الرقم الوطني',
                                  hintStyle: TextStyle(fontSize: 14),
                                  contentPadding:
                                      EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.circular(10.0)),
                                  fillColor: Color(0xffF3F3F3),
                                  filled: true),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.0,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            controller: _nameController,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                hintText: '  الاسم الكامل',
                                hintStyle: TextStyle(fontSize: 14),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                fillColor: Color(0xffF3F3F3),
                                filled: true),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.0,
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextFormField(
                            controller: _localController,
                            keyboardType: TextInputType.text,
                            autofocus: false,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                hintText: '  المنطقة',
                                hintStyle: TextStyle(fontSize: 14),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.0)),
                                fillColor: Color(0xffF3F3F3),
                                filled: true),
                          ),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: MediaQuery.of(context).size.width,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: <Widget>[
                            Container(
                              child: DecoratedBox(
                                decoration: ShapeDecoration(
                                  color: Color(0xffF3F3F3),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Color(0XFFF3F3F3),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(11.0)),
                                  ),
                                ),
                                child: Container(
                                  height: 40.0,
                                  width: 250,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.arrow_drop_down,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          iconSize: 0,
                                          value: sectionValue,
                                          onChanged: (String text) {
                                            setState(() {
                                              sectionValue = text;
                                            });
                                          },
                                          items: sectionItems
                                              .map<DropdownMenuItem<String>>(
                                                  (String text) {
                                            return DropdownMenuItem<String>(
                                              value: text,
                                              child: Align(
                                                alignment: Alignment.center,
                                                child: Text(text),
                                              ),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: DecoratedBox(
                                decoration: ShapeDecoration(
                                  color: Color(0xffF3F3F3),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Color(0XFFF3F3F3),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(11.0)),
                                  ),
                                ),
                                child: Container(
                                  height: 40.0,
                                  width: 250,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.arrow_drop_down,
                                      ),

                                      DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          iconSize: 0,
                                          value: mValue,
                                          onChanged: (String text) {
                                            setState(() {
                                              mValue = text;
                                            });
                                          },
                                          items: mItems
                                              .map<DropdownMenuItem<String>>(
                                                  (String text) {
                                            return DropdownMenuItem<String>(
                                              value: text,
                                              child: Text(text),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                      //  ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              child: DecoratedBox(
                                decoration: ShapeDecoration(
                                  color: Color(0xffF3F3F3),
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                      width: 1.0,
                                      style: BorderStyle.solid,
                                      color: Color(0XFFF3F3F3),
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(11.0)),
                                  ),
                                ),
                                child: Container(
                                  height: 40.0,
                                  width: 250,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: <Widget>[
                                      Icon(
                                        Icons.arrow_drop_down,
                                        textDirection: TextDirection.ltr,
                                      ),
                                      DropdownButtonHideUnderline(
                                        child: DropdownButton<String>(
                                          iconSize: 0,
                                          value: lValue,
                                          onChanged: (String text) {
                                            setState(() {
                                              lValue = text;
                                            });
                                          },
                                          items: lItems
                                              .map<DropdownMenuItem<String>>(
                                                  (String text) {
                                            return DropdownMenuItem<String>(
                                              value: text,
                                              child: Text(text),
                                            );
                                          }).toList(),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.only(
                            top: 30.0, bottom: 5.0, left: 5.0, right: 5.0),
                        alignment: AlignmentDirectional.topEnd,
                        child: DecoratedBox(
                          decoration: ShapeDecoration(
                            color: Color(0xffF3F3F3),
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 1.0,
                                style: BorderStyle.solid,
                                color: Color(0XFFF3F3F3),
                              ),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(11.0)),
                            ),
                          ),
                          child: Container(
                            height: 40.0,
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: <Widget>[
                                Icon(
                                  Icons.arrow_drop_down,
                                ),
                                DropdownButton<String>(
                                  iconSize: 0,
                                  value: typeValue,
                                  onChanged: (String text) {
                                    setState(() {
                                      typeValue = text;
                                    });
                                  },
                                  items: typeItems
                                      .map<DropdownMenuItem<String>>(
                                          (String text) {
                                    return DropdownMenuItem<String>(
                                      value: text,
                                      child: Text(
                                        text,
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  }).toList(),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 50.0,
                        margin: EdgeInsets.only(bottom: 30.0),
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Align(
                            alignment: AlignmentDirectional.topEnd,
                            child: IntrinsicWidth(
                              child: TextFormField(
                                controller: _subjectController,
                                keyboardType: TextInputType.text,
                                autofocus: false,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                    hintText: '  الموضوع',
                                    hintStyle: TextStyle(fontSize: 14),
                                    contentPadding: EdgeInsets.fromLTRB(
                                        20.0, 5.0, 20.0, 5.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                    ),
                                    fillColor: Color(0xffF3F3F3),
                                    filled: true),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            controller: _detailsController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 10,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                hintText: '  التفاصيل',
                                hintStyle: TextStyle(fontSize: 14),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                fillColor: Color(0xffF3F3F3),
                                filled: true),
                          ),
                        ),
                      ),
                      Container(
                        child: Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: TextField(
                            controller: _suggestionController,
                            keyboardType: TextInputType.multiline,
                            maxLines: 4,
                            textAlign: TextAlign.right,
                            decoration: InputDecoration(
                                hintText:
                                    '  ما هو اقتراحك لضمان عدم تكرار هذه الشكوى مستقبلا؟',
                                hintStyle: TextStyle(fontSize: 14),
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                fillColor: Color(0xffF3F3F3),
                                filled: true),
                          ),
                        ),
                      ),
                      Container(
                        child: RaisedButton(
                          onPressed: () {
                            db.makeRequest(
                              int.parse(_numberController.text.trim()),
                              _nameController.text.trim(),
                              _localController.text.trim(),
                              _lController.text.trim(),
                              _mController.text.trim(),
                              _sectionController.text.trim(),
                              _typeController.text.trim(),
                              _subjectController.text.trim(),
                              _detailsController.text.trim(),
                              _suggestionController.text.trim(),
                            );
                            Navigator.of(context).push(new MaterialPageRoute(
                              builder: (BuildContext context) => new Done(),
                            ));
                          },
                          child: Text(' ارسال',
                              style: TextStyle(color: Colors.white)),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          color: Color(0XFF4D7FFF),
                        ),
                      ),
                    ],
                  ),
                ),

          
              ]),

              
            ],
          ),
        ),
      ),
    );
  }
}
