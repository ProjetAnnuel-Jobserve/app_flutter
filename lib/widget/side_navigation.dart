import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:side_navigation/side_navigation.dart';

typedef void IntCallback(int id);

class SideNavigation extends StatelessWidget {
  final IntCallback updateRoute;
  final int index;
  SideNavigation({ required this.updateRoute , required this.index});

  @override
  Widget build(BuildContext context) {
    return SideNavigationBar(
            selectedIndex: this.index,
            items: const [
              SideNavigationBarItem(
                icon: Icons.person,
                label: 'Utilisateurs',
              ),
              SideNavigationBarItem(
                icon: Icons.call,
                label: 'Conferences',
              ),
              SideNavigationBarItem(
                icon: Icons.event,
                label: 'Evenements',
              ),
              SideNavigationBarItem(
                icon: Icons.person_pin_rounded,
                label: 'Profil',
              ),
              SideNavigationBarItem(
                icon: Icons.logout,
                label: 'Deconnexion',
              ),
            ],
            onTap: (index) {
              updateRoute(index);
            },
            theme: SideNavigationBarTheme(backgroundColor: Colors.white,togglerTheme: SideNavigationBarTogglerTheme.standard(),
              itemTheme: SideNavigationBarItemTheme(selectedItemColor: jSecondaryColor,),
              dividerTheme: SideNavigationBarDividerTheme.standard(),),
          );

  }
}