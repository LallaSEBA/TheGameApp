import 'package:flutter/material.dart';
import '../widget/navigationBar.dart';

class NotificationHome extends StatefulWidget {
  _NotificationHomeState createState() => _NotificationHomeState();
}

class _NotificationHomeState extends State<NotificationHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: navigationBar(isAdmin: false,index: 2,),
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
                      image: AssetImage('assets/image/u1.JPG'),
                      //fit: BoxFit.cover,
                      fit: BoxFit.none,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: 20.0, bottom: 20.0, left: 5.0, right: 5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        padding: EdgeInsets.all(20.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Container(
                                  height: 200,
                                  child: RichText(
                                    text: TextSpan(
                                      children: [
                                        TextSpan(
                                            text: "الإشعارات ",
                                            style: TextStyle(
                                                fontSize: 40,
                                                color: Colors.white)),
                                        WidgetSpan(
                                          child: Icon(
                                            Icons.notifications,
                                            size: 40,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            Container(
                              // child: Card(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  Card(
                                    color: Color(0XFF4D7FFF),
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const ListTile(
                                      title: Text(
                                        'قبل 1 دقيقة ',
                                        style: TextStyle(
                                            fontSize: 10.0,
                                            color: Colors.white),
                                      ),
                                      subtitle: Text(
                                        'تمت الإجابة على طلبك، تفحص بريدك الإلكتروني ',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 14.0,
                                          color: Colors.white,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const ListTile(
                                      // leading: Icon(Icons.album),
                                      title: Text(
                                        'بالأمس ',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                      subtitle: Text(
                                        'تم ارسال طلبك',
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const ListTile(
                                      // leading: Icon(Icons.album),
                                      title: Text(
                                        '12/12/2020 ',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                      subtitle: Text(
                                        'تمت الإجابة على طلبك، تفحص بريدك الإلكتروني ',
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                  ),
                                  Card(
                                    elevation: 5,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: const ListTile(

                                      title: Text(
                                        '01/12/2020',
                                        style: TextStyle(fontSize: 10.0),
                                      ),
                                      subtitle: Text(
                                        'تم ارسال طلبك',
                                        textAlign: TextAlign.right,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              // ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ]),
            
              /// bottom bar
             /* Container(
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
