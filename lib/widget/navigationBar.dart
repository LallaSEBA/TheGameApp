import 'package:flutter/material.dart';
import 'package:shaths_app_thegame/controller/user_controller.dart';
import '../controller/function.dart';
import '../ressources/const.dart';
class navigationBar extends StatefulWidget {
  final bool isAdmin;
  final int index;

  const navigationBar({Key key, this.isAdmin, this.index}) : super(key: key);
  @override
  _navigationBarState createState() => _navigationBarState();
}

class _navigationBarState extends State<navigationBar> {
  int indexSelected = 0;
  bool first=false;
  @override
  void initState() {
   // if(widget.index!=null && widget.index>0)  indexSelected = widget.index;
     first = true;
    super.initState();
  }
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
                currentIndex: indexSelected,     
                items: [  
                  first?BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),),  icon: Image.asset("assets/image/user1.png", width: 40,)):  
                  BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),), activeIcon: Image.asset("assets/image/user.png", width: 40,),  icon: Image.asset("assets/image/user1.png", width: 40,)),  
                  BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),), activeIcon: Image.asset("assets/image/file.png", width: 40,),  icon: Image.asset("assets/image/file1.png", width: 40.0)),  
                  (!widget.isAdmin) ? 
                  BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),), activeIcon:  Image.asset("assets/image/notification.png", width: 40.0), icon:  Image.asset("assets/image/notification1.png", width: 40.0)):null,  
                  BottomNavigationBarItem(title: Text('', style: TextStyle(fontSize: 0),), activeIcon:  Image.asset("assets/image/exit.png", width: 40.0), icon:  Image.asset("assets/image/exit1.png", width: 40.0)),  
                ],  
                onTap: (int i) {
                        if (UserController.user.isAdmin!=null && UserController.user.isAdmin)
                        switch (i){ 
                          case 0:Navigator.of(context).pushNamed('/accountAdm');
                           break;
                          case 1:Navigator.of(context).pushNamed('/shakwaAdm');
                           break;
                          case 2:fctExit();
                           break;
                        }else
                        switch (i){ 
                          case 0:Navigator.of(context).pushNamed('/account');
                           break;
                          case 1:Navigator.of(context).pushNamed('/shakwa');
                           break;
                          case 2:Navigator.of(context).pushNamed('/notif');
                           break;
                          case 3:fctExit();
                           break;
                        }
                        first = false;
                        setState(() {
                          indexSelected = i;
                        });
                        
                                 
                }          
        ));
  }
}  
 