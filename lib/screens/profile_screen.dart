import 'package:flutter/material.dart';
import 'package:jobserve_ref/widget/profile_item.dart';

import '../widget/profile/profile_future.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ProfileFuture();
  }
}