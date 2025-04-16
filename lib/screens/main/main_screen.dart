import 'package:dashboard_or_admin_panel/controllers/MenuController2.dart';
import 'package:dashboard_or_admin_panel/responsive.dart';
import 'package:dashboard_or_admin_panel/screens/dashboard/dashboard_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'components/side_menu.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: context.read<MenuController2>().scaffoldKey,
      drawer: SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //we want this side menu only for large screen
            if(Responsive.isDesktop(context))
             Expanded(
                //default flex = 1
                // and it takes 5/6 part of the screen
                child: Drawer(
                  child: SideMenu(),
                )),
            Expanded(
                //It takes 5/6 part of the screen
                flex: 5,
                child: DashBoardScreen()
            ),
          ],
        ),
      ),
    );
  }
}
