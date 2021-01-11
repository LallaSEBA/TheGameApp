import 'package:flutter/material.dart';

class Myhome extends StatefulWidget {
  ResetPwd createState() => ResetPwd();
}

class ResetPwd extends State<Myhome> {
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
                      image: AssetImage('assests/7_background.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 250.0, bottom: 5.0, left: 20.0, right: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          'يجب أن تحتوي كلمة السر على الأقل 8 خانات',
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          '(eg:@,/,_,...)  ورمز من الرموز التالية ',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 60.0,
                                bottom: 10.0,
                                left: 10.0,
                                right: 10.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(

                                    labelText: 'كلمة السر',

                                    suffixIcon: Icon(Icons.remove_red_eye)
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 60.0,
                                bottom: 10.0,
                                left: 10.0,
                                right: 10.0),
                            child: Directionality(
                              textDirection: TextDirection.rtl,
                              child: TextField(
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                    labelText: 'تأكيد كلمة السر ',
                                    suffixIcon: Icon(Icons.remove_red_eye)),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 70.0, bottom: 70.0),
                        child: Container(
                          child: Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: RaisedButton(
                                    child: Text(
                                      'إعادة تعيين كلمة السر',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    textColor: Colors.white,
                                    color: Color(0xfF4D7FFF),
                                    onPressed: () {}),
                              )),
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