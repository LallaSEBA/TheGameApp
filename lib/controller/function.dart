import 'package:flutter/services.dart';
import 'package:shaths_app_thegame/controller/user_controller.dart';

fctExit(){
    var db = UserController();
    db.logOut();
    Future.delayed(const Duration(milliseconds: 1000), () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
}