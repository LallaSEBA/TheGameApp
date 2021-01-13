import 'package:flutter/services.dart';

fctExit(){
    Future.delayed(const Duration(milliseconds: 1000), () {
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    });
}