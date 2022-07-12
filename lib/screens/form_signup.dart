// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:jobserve_ref/screens/home_screen.dart';

// Define a custom Form widget.
class FormConnexion extends StatefulWidget {
  @override
  _FormState createState() => _FormState();
}

class _FormState extends State<FormConnexion> {
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
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
                ),
              ),
        ],
      ),
    );
  }

  void _goToA(BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (BuildContext context) => HomeScreen(title: "test",),
      ),
    );
  }
}
