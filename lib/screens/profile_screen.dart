import 'package:flutter/material.dart';
import 'package:jobserve_ref/widget/profile_item.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ProfileItem(),
    );
  }
}