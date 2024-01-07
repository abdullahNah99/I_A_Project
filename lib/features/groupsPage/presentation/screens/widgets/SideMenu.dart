import 'package:flutter/material.dart';
import 'package:i_a_project/features/groupsPage/presentation/screens/widgets/DrawerListTile.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: SingleChildScrollView(
        child: Column(
          children: [
            const DrawerHeader(
              child: Image(
                image: AssetImage("assets/images/signin_balls.png"),
              ),
            ),
            DrawerListTile(
              title: "My Groups",
              svgIcon: "assets/icons/menu_dashbord.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "My Files",
              svgIcon: "assets/icons/menu_tran.svg",
              press: () {},
            ),
            DrawerListTile(
              title: "Account",
              svgIcon: "assets/icons/menu_profile.svg",
              press: () {},
            )
          ],
        ),
      ),
    );
  }
}
