import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:jobserve_ref/screens/connexion_screen.dart';
import 'package:jobserve_ref/screens/event_screen.dart';
import 'package:jobserve_ref/screens/profile_screen.dart';
import 'package:jobserve_ref/services/firebase_auth_service.dart';
import 'package:jobserve_ref/widget/side_navigation.dart';
import 'package:jobserve_ref/widget/table_event.dart';
import 'package:page_transition/page_transition.dart';


class HomeScreen extends StatefulWidget {
  const HomeScreen({required this.title});

  final String title;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

List<Widget> views = const [
    Center(
      child: Text('Users'),
    ),
    Center(
      child: Text('Conference'),
    ),
    Center(
      child: EventScreen(),
    ),
    Center(
      child: ProfileScreen(),
    ),
];



class _HomeScreenState extends State<HomeScreen> {

  int selectedIndex = 0;

  void getNewRoute(int newId){
    setState(() {
      if(newId == 4){
        _logout(context);
      }else{
        selectedIndex = newId;
      }
    });
  }

  void _logout(BuildContext context) {
    FirebaseAuthService.logout(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: jSecondaryColor,
          title: Text(widget.title),
        ),
        body: Row(
          children: [
            SideNavigation(
              index: selectedIndex,
              updateRoute: (int newId){
                getNewRoute(newId);
              },
            ),
            Expanded(
              child: views.elementAt(selectedIndex),
            ),
          ],
        ),
    );
  }
}
