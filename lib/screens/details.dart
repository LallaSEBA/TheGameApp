import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/widget/navigationBar.dart';

class Myhome extends StatefulWidget {
  DetailsHome createState() => DetailsHome();
}

class DetailsHome extends State<Myhome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBar(isAdmin: false,),
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
                      image: AssetImage('assests/details.jpg'),
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
                                      hintText: ' التاريخ : 2020/12/23',
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
                                          items: [
                                            DropdownMenuItem<String>(
                                              value: "1",
                                              child: Center(
                                                child: Text(
                                                  "القطاعات",
                                                ),
                                              ),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "2",
                                              child: Center(
                                                child: Text("القطاعات 1 "),
                                              ),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "3",
                                              child: Center(
                                                child: Text("القطاعات 2 "),
                                              ),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "4",
                                              child: Center(
                                                child: Text(
                                                    "الأشخاص ذوي الإعاقة ومراكزها "),
                                              ),
                                            ),
                                          ],
                                          onChanged: (_value) => {
                                            print(_value.toString()),
                                          },
                                          hint: Text('القطاعات'),
                                          value: "1",
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(width: 20,),


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
                                          items: [
                                            DropdownMenuItem<String>(
                                              value: "1",
                                              child: Center(
                                                child: Text(
                                                  "المحافظة",
                                                ),
                                              ),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "2",
                                              child: Center(
                                                child: Text("المحافظة 1 "),
                                              ),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "3",
                                              child: Center(
                                                child: Text("المحافظة 2 "),
                                              ),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "4",
                                              child: Center(
                                                child: Text("المحافظة 3 "),
                                              ),
                                            ),
                                          ],
                                          onChanged: (_value) => {
                                            print(_value.toString()),
                                          },
                                          hint: Text('المحافظة'),
                                          value: "1",
                                        ),
                                      ),
                                      //  ),
                                    ],
                                  ),
                                ),
                              ),
                            ),


                            SizedBox(width: 20,),




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
                                          items: [
                                            DropdownMenuItem<String>(
                                              value: "1",
                                              child: Center(
                                                child: Text(
                                                  "اللواء",
                                                ),
                                              ),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "2",
                                              child: Center(
                                                child: Text("اللواء 1 "),
                                              ),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "3",
                                              child: Center(
                                                child: Text("اللواء 2 "),
                                              ),
                                            ),
                                            DropdownMenuItem<String>(
                                              value: "4",
                                              child: Center(
                                                child: Text("اللواء 3 "),
                                              ),
                                            ),
                                          ],
                                          onChanged: (_value) => {
                                            print(_value.toString()),
                                          },
                                          hint: Text('اللواء'),
                                          value: "1",
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

                                //   Padding(
                                //   padding: EdgeInsets.all(5.0),
                                DropdownButtonHideUnderline(
                                  child: DropdownButton<String>(
                                    iconSize: 0,
                                    items: [
                                      DropdownMenuItem<String>(
                                        value: "1",
                                        child: Center(
                                          child: Text(
                                            "نوع الطلب",
                                          ),
                                        ),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: "2",
                                        child: Center(
                                          child: Text("شكوى "),
                                        ),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: "3",
                                        child: Center(
                                          child: Text("ثناء "),
                                        ),
                                      ),
                                      DropdownMenuItem<String>(
                                        value: "4",
                                        child: Center(
                                          child: Text("اقتراح "),
                                        ),
                                      ),
                                    ],
                                    onChanged: (_value) => {
                                      print(_value.toString()),
                                    },
                                    hint: Text('نوع الطلب'),
                                    value: "1",
                                  ),
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
                          onPressed: () {},
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

                // appBar:AppBar(

                Positioned(
                  child: AppBar(
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    title: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.all(5.0),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              icon: Icon(
                                Icons.keyboard_arrow_down,
                                color: Colors.white,
                              ),
                              items: [
                                DropdownMenuItem<String>(
                                  value: "1",
                                  child: Center(
                                    child: Text(
                                      "En",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                                DropdownMenuItem<String>(
                                  value: "2",
                                  child: Center(
                                    child: Text(
                                      "Ar",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ],
                              onChanged: (_value) => {
                                print(_value.toString()),
                              },
                              hint: Text(
                                'Ar',
                                style: TextStyle(color: Colors.white),
                              ),
                              value: "2",
                            ),
                          ),
                        ),
                      ],
                    ),
                    actions: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 16),
                        child: Icon(
                          Icons.menu,
                        ),
                      ),
                    ],
                  ),
                ),
              ]),

              /*/// bottom bar
              Container(
                //height: MediaQuery.of(context).size.height,

                child: BottomAppBar(
                  color: Colors.black,
                  child: Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.person),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 40,
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.file_copy_rounded),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 40,
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.add_alert),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 40,
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.exit_to_app_rounded),
                        onPressed: () {},
                        color: Colors.white,
                        iconSize: 40,
                      ),
                    ],
                  ),
                ),
              ),*/
            ],
          ),
        ),
      ),
    );
  }
}
