import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/widget/drawer_adm.dart';
import '../ressources/strings.dart';
import '../widget/all.dart';
import '../widget/tribute.dart';
import '../widget/complain.dart';
import '../widget/suggestin.dart';

class Complain extends StatefulWidget{
  final index;

  const Complain({Key key, this.index}) : super(key: key);

  @override
  _Complainstate createState()=> _Complainstate();
}

class _Complainstate extends State<Complain> with SingleTickerProviderStateMixin {  
  
  TabController _controller;

  
  void initState() {

    _controller = TabController(length:4, vsync: this, initialIndex: widget.index);
    _controller.addListener(() {
      setState(() {
       var _selectedIndex = _controller.index;
      });
      print("Selected Index: " + _controller.index.toString());
    });

    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        extendBodyBehindAppBar:true,
        appBar: AppBar(
          backgroundColor: Colors.transparent,

          bottom: TabBar(
              indicatorColor:Colors.black,
              labelColor:Colors.black,
              labelStyle: TextStyle(
                fontSize: 21.0,
                fontWeight: FontWeight.bold,
              ),
              tabs:[
                Tab(text:str_iktirah),
                Tab(text:str_shakwa),
                Tab(text:str_thana),
                Tab(text: str_All),
              ]
          ),
          elevation: 0,
        ),
        endDrawer: drawerAdm(context),
        body:new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/image/u6.JPG'),
              fit: BoxFit.fill,
            ),
          ),
          child: TabBarView(

            children:[
              new  Home3(),
              new  Home2(),
              new  Home1(),
              new  Home(),
            ],
          ),),

      ),

    );
  }

}









