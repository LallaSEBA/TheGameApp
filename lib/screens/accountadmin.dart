//***************************************************
//***************** Oum Maria ***********************

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

class AccountAdminPage extends StatefulWidget {
  AccountAdminPage({Key key}) : super(key: key);
  //final String title;

  @override
  AccountAdminPageState createState() => AccountAdminPageState();
}

class AccountAdminPageState extends State<AccountAdminPage> {
  final TextEditingController _nameUserA = new TextEditingController();
  final TextEditingController _nationalIdA = new TextEditingController();
  final TextEditingController _phoneNumA = new TextEditingController();
  final TextEditingController _addressUserA = new TextEditingController();
  final TextEditingController _cityUserA = new TextEditingController();
  final TextEditingController _userGovernorateA = new TextEditingController();
  //we put the gender user in variable to choose which icon we put in wiget
  //var gender = userGender;
  //variable of image
  File _image1;
  //function of added image by camera or gallery
  _imgFromCamera() async {
    File image1 = await ImagePicker.pickImage(
        source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image1 = image1;
    });
  }

  _imgFromGallery() async {
    File image1 = await ImagePicker.pickImage(
        source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image1 = image1;
    });
  }

  //function to choose what we need to do add by camera or bay gallery
  void _showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: new Wrap(
                children: <Widget>[
                  new ListTile(
                      leading: new Icon(Icons.photo_library),
                      title: new Text('اضافة من المجلد'),
                      onTap: () {
                        _imgFromGallery();
                        Navigator.of(context).pop();
                      }),
                  new ListTile(
                    leading: new Icon(Icons.photo_camera),
                    title: new Text('اخذ صورة'),
                    onTap: () {
                      _imgFromCamera();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Account',
      home: Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
       //   toolbarHeight: 27.0,
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back, color: Color(0xffFFFFFF)),
              onPressed: () {}),
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
        body: Container(
          constraints: BoxConstraints.expand(),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/u9.jpg'),
              fit: BoxFit.fill,
            ),
          ),
          padding: EdgeInsets.only(left: 35, top: 0, right: 35.0, bottom: 5.0),
          child: new ListView(
            children: <Widget>[
              new Center(
                child: new Column(
                  children: <Widget>[
                    GestureDetector(
                      onTap: () {
                        _showPicker(context);
                      },
                      child: Align(
                        alignment: Alignment(0.3, 0.2),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          child: new IconButton(
                            icon: new Icon(Icons.add_a_photo,
                                color: Colors.white),
                            color: Color(0xffFFFFFF),
                            //  هنا نبرمج الفاكشن الخاصة باضافة صورة عند الضغط على أيقونة الكامرة
                          ),
                        ),
                      ),
                    ),
                    //image by default
                    Align(
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Colors.transparent,
                        radius: 55,
                        child: _image1 == null
                            ? ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: new Image.asset(
                            'images/account.jpg',
                            height: 250.0,
                            width: 100.0,
                            fit: BoxFit.fill,
                          ),
                        )
                            : ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.file(
                            _image1,
                            height: 250.0,
                            width: 100.0,
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'الاسم الكامل',
                            style: TextStyle(
                              fontSize: 12.0,
                              color: Color(0xff000000),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          WidgetSpan(
                            child: Icon( // gender == male? MdIcons.genderMale:
                              MdiIcons.genderFemale,
                              size: 15,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                    ),
                    new Text(
                      'email@email.com',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Color(0xffB9B9B9),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 25.0),
              ),
              new Container(
                child: new Text(
                  'الاسم',
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: new Container(
                  height: 30,
                  child: new TextField(
                    textDirection: TextDirection.rtl,
                    controller: _nameUserA,
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
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 25.0),
              ),
              new Container(
                child: new Text(
                  'الرقم الوطني',
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: new Container(
                  height: 30,
                  child: new TextField(
                    textDirection: TextDirection.rtl,
                    controller: _nationalIdA,
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
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 25.0),
              ),
              new Container(
                child: new Text(
                  'رقم الهاتف',
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: new Container(
                  height: 30,
                  child: new TextField(
                    textDirection: TextDirection.rtl,
                    controller: _phoneNumA,
                    keyboardType: TextInputType.phone,
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
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 25.0),
              ),
              new Container(
                child: new Text(
                  'المنطقة',
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: new Container(
                  height: 30,
                  child: new TextField(
                    textDirection: TextDirection.rtl,
                    controller: _addressUserA,
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
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 25.0),
              ),
              new Container(
                child: new Text(
                  'المدينة',
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: new Container(
                  height: 30,
                  child: new TextField(
                    textDirection: TextDirection.rtl,
                    controller: _cityUserA,
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
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 25.0),
              ),
              new Container(
                child: new Text(
                  'المحافظة',
                  textDirection: TextDirection.rtl,
                  style: new TextStyle(
                    color: Color(0xff333333),
                    fontWeight: FontWeight.w700,
                    fontSize: 12.0,
                  ),
                ),
              ),
              Card(
                elevation: 5,
                child: new Container(
                  height: 30,
                  child: new TextField(
                    textDirection: TextDirection.rtl,
                    controller: _userGovernorateA,
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
                    ),
                  ),
                ),
              ),
              new Padding(
                padding: new EdgeInsets.only(top: 75.0),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
