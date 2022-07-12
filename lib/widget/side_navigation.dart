import 'package:flutter/material.dart';
import 'package:side_navigation/side_navigation.dart';

class SideNavigation extends StatefulWidget {
  const SideNavigation({ Key? key }) : super(key: key);

  @override
  State<SideNavigation> createState() => _SideNavigationState();
}

class _SideNavigationState extends State<SideNavigation> {

  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SideNavigationBar(
            selectedIndex: selectedIndex,
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
                icon: Icons.settings,
                label: 'Profil',
              ),
              SideNavigationBarItem(
                icon: Icons.logout,
                label: 'Deconnexion',
              ),
            ],
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
            },
          );
  }
}