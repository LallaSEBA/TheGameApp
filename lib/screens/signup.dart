import 'package:flutter/material.dart';
import '../controller/user_controller.dart';

class SignUp extends StatefulWidget {
  _SignUp createState() => _SignUp();
}

class _SignUp extends State<SignUp> {
  TextEditingController email     = TextEditingController();
  TextEditingController password  = TextEditingController();
  TextEditingController cPassword = TextEditingController();
  var db = UserController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Stack(children: <Widget>[
                Container(
                  height: MediaQuery.of(context).size.height*1.25,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/image/u3.JPG'),
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 40.0, bottom: 5.0, left: 20.0, right: 40.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'تسجيل',
                          style: TextStyle(
                            fontSize: 30,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.0, right: 20.0),
                        child: Align(
                          alignment: Alignment.topRight,
                          child: Text(
                            'أنشئ حساب جديد',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
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
                                controller: email,
                                textAlign: TextAlign.right,
                                decoration: InputDecoration(
                                    labelText: 'البريد الإلكتروني',
                                    suffixIcon: Padding(
                                      padding: const EdgeInsets.all(10.0),
                                      child: Image.asset("assets/image/email.png", width: 5, height: 5, fit: BoxFit.contain,),
                                    )),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            controller: password,
                            textAlign: TextAlign.right,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'كلمة السر',
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset("assets/image/eye.png", width: 5, height: 5, fit: BoxFit.contain,),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Directionality(
                          textDirection: TextDirection.rtl,
                          child: TextField(
                            controller: cPassword,
                            textAlign: TextAlign.right,
                            obscureText: true,
                            decoration: InputDecoration(
                                labelText: 'تأكيد كلمة المرور',
                                suffixIcon: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Image.asset("assets/image/eye.png", width: 5, height: 5, fit: BoxFit.contain,),
                                )),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 50.0, bottom: 50.0),
                        child: Container(
                         // child: Expanded(
                              child: SizedBox(
                                width: double.infinity,
                                child: RaisedButton(
                                    child: Text(
                                      'استمر',
                                      style: TextStyle(fontSize: 16),
                                    ),
                                    textColor: Colors.white,
                                    color: Color(0xfF4D7FFF),
                                    onPressed: () async{
                                     var response = await db.registerData(email.text, password.text, cPassword.text);//lalla@seba_123.com
                                     print('response register: ${response}');
                                     if(response) 
                                        Navigator.of(context).pushReplacementNamed('/fillUp');
                                      }),
                              )//),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Container(
                              child: IconButton(
                                  padding: EdgeInsets.only(right: 10,),
                                  icon: Image.asset("assets/image/exit2.png" ,fit: BoxFit.contain,width: 120,height: 90,),
                                  onPressed: null)),
                         // Spacer(),
                          Container(
                            child: Column(
                              children: <Widget>[
                                Directionality(
                                  textDirection: TextDirection.rtl,
                                  child: Text(
                                    "هل لديك حساب؟",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                FlatButton(
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Text(
                                      "تسجيل دخول",
                                      style: TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold,
                                        color: Color(0xfF4D7FFF),
                                        decoration: TextDecoration.underline,
                                      ),
                                      textAlign: TextAlign.right,
                                    ),
                                  ),
                                  onPressed: () {
                                    Navigator.of(context).pushReplacementNamed('/loginUser');
                                  },
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                /*Positioned(
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
                  ),
                ),*/
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
