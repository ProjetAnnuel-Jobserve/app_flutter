import 'package:flutter/material.dart';
import 'package:jobserve_ref/widget/user/user_list.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return UserList();
  }
}