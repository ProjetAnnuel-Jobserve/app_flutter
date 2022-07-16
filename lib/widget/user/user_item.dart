import 'package:flutter/material.dart';
import 'package:jobserve_ref/models/user_model.dart';
import 'package:jobserve_ref/widget/user/user_detail.dart';

class UserItem extends StatelessWidget {
  final User user;

  const UserItem({
    Key? key,
    required this.user,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        _goTo(context, Card_User.routeName, argument: user);
      },
      leading: Icon(Icons.person),
      title: Text("${user.firstname} ${user.lastname}"),
    );
  }

  void _goTo(BuildContext context, String name, {dynamic argument}) {
    Navigator.of(context).pushNamed(name, arguments: argument);
  }
}
