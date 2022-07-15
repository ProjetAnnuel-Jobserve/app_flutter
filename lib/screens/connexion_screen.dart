// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:jobserve_ref/screens/form_signin.dart';

class ConnexionScreen extends StatelessWidget {
  const ConnexionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  jPrimaryColor,
                  jSecondaryColor,
                ],
              ),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Center(
                      child: Text(
                        "Jobserve",
                        style: TextStyle(
                          fontSize: 45,
                          color: Colors.white)
                      )
                    ),
                  ),
                ),
                Expanded(
                  flex: 6,
                  child: Container(
        
                        width: MediaQuery.of(context).size.width / 2,
                        child: SignIn(),
        
                  
                  ),
                ),
              ],
            ),
          ),
    );
  }
}

