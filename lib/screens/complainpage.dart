import 'package:flutter/material.dart';
import '../widget/all.dart';
import '../widget/tribute.dart';
import '../widget/complain.dart';
import '../widget/suggestin.dart';

class Complain extends StatefulWidget{

  @override
  _Complainstate createState()=> _Complainstate();
}

class _Complainstate extends State<Complain>{
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
                Tab(text:'اقتراح'),
                Tab(text:'شكوى'),
                Tab(text:'ثناء'),
                Tab(text: 'الكل',),



              ]
          ),
          elevation: 0,
        ),
        endDrawer: Drawer(),
        body:new Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('images/u6.jpg'),
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









