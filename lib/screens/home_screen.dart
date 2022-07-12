import 'package:flutter/material.dart';
import 'package:jobserve_ref/widget/side_navigation.dart';


class HomeScreen extends StatelessWidget {
  const HomeScreen({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(title),
        ),
        body: Row(
          children: [
            SideNavigation(),
            Expanded(
              child: Center(child: Text("Test"))
            ),
          ],
        ),
    );
  }
}
