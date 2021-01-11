import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/controller/const.dart';
class navigationBar extends StatefulWidget {
  final bool isAdmin;

  const navigationBar({Key key, this.isAdmin}) : super(key: key);
  @override
  _navigationBarState createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  int index = 0;
  bool first=true;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62,
      child: BottomNavigationBar(                  
                type: BottomNavigationBarType.fixed,  
                backgroundColor: cGreyL,  
                //selectedItemColor: cBlue,  
                unselectedItemColor: cWhite,  
                fixedColor: Colors.red,
                currentIndex: index,     
                items: [  
                  first?BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),),  icon: Image.asset("assets/image/user1.png", width: 40,)):  
                  BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),), activeIcon: Image.asset("assets/image/user.png", width: 40,),  icon: Image.asset("assets/image/user1.png", width: 40,)),  
                  BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),), activeIcon: Image.asset("assets/image/file.png", width: 40,),  icon: Image.asset("assets/image/file1.png", width: 40.0)),  
                  (!widget.isAdmin) ? 
                  BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),), activeIcon:  Image.asset("assets/image/notification.png", width: 40.0), icon:  Image.asset("assets/image/notification1.png", width: 40.0)):null,  
                  BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),), activeIcon:  Image.asset("assets/image/exit.png", width: 40.0), icon:  Image.asset("assets/image/exit1.png", width: 40.0)),  
                ],  
                onTap: (int i) {
                        first = false;
                        setState(() {
                          index = i;
                        }
                        );         
                }          
        ));
  }
}  
 