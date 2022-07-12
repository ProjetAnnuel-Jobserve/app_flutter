

import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:jobserve_ref/screens/home_screen.dart';
import 'package:page_transition/page_transition.dart';

class SignIn extends StatelessWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final nameController = TextEditingController();
    final passwordController = TextEditingController();

    return Container(
      child: Column(
        children: [
          ListTile(
            leading: Icon(
              Icons.account_circle,
              color: lightgrey,
            ),
            title: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'username',
                hintStyle: TextStyle(color: lightgrey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),  
              ),
              controller: nameController,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.lock,
              color: lightgrey,
            ),
            title: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              decoration: InputDecoration(
                hintText: 'password',
                hintStyle: TextStyle(color: lightgrey),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ), 
              ),
              controller: passwordController,
              style: TextStyle(color: Colors.white),
            ),
          ),
          TextButton(
              onPressed: () => _goToA(context),
              child: Text(
                "Submit",
                style: TextStyle(color: Colors.white)
                )
              ),
        ],
      ),
    );
  }

  void _goToA(BuildContext context) {
    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: HomeScreen(title: "List")));
  }
}