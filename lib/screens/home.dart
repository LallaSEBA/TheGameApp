import 'package:flutter/material.dart';
import '../ressources/const.dart';
import '../widget/drawer_user.dart';
import '../widget/drawer_adm.dart';
import '../widget/navigationBar.dart';

class Home extends StatelessWidget {
  final bool isAdmin;
  const Home({Key key, this.isAdmin}) : super(key: key);
   
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: cGreyB,
        iconTheme:IconThemeData (color:cGreyT),
      ),
      endDrawer: isAdmin? drawerAdm(context):drawerUser(context),
      bottomNavigationBar:navigationBar(isAdmin: this.isAdmin),
      extendBodyBehindAppBar: true,
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        color: cGreyB,
      ),           
          );
        }
}