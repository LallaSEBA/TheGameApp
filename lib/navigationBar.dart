import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/const.dart';
 navigationBar(){

return Container(
  height: 55,
  child:   BottomNavigationBar(  
            type: BottomNavigationBarType.fixed,  
            backgroundColor: cGreyB,  
            selectedItemColor: cBlue,  
            unselectedItemColor: cWhite,  
            currentIndex: 0,     
            items: [  
               BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),),  icon: Image.asset("assets/image/u10.png", width: 40,)),  
               BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),),  icon:  Icon(Icons.file_download, size: 40.0),),  
               BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),), icon:  Icon(Icons.notifications_active, size: 40.0),),  
               BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),), icon: Icon(Icons.exit_to_app, size: 40.0)),  
            ],  
            //onTap: (int x) => debugPrint('index $x'),  
          ),
);
}