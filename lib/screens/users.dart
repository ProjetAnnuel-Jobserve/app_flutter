import 'package:flutter/material.dart';
import 'package:jobserve_ref/widget/side_navigation.dart';
import 'package:jobserve_ref/widget/user/user_list.dart';
import 'package:jobserve_ref/screens/users.dart';
class Users_Screen extends StatelessWidget {
  const Users_Screen({required this.title});

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
              child: UserList(),
          ),
        ],
      ),
    );
  }
}
