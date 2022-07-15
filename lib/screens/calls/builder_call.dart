import 'package:flutter/material.dart';
import 'package:jobserve_ref/managers/call_manager.dart';
import 'package:jobserve_ref/screens/calls/login_screen.dart';

class BuilderCall extends StatelessWidget {
  const BuilderCall({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
        builder: (context) {
          CallManager.instance.init(context);
          return LoginScreen();
        },
      );
  }
}