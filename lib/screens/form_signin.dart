

import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:jobserve_ref/screens/home_screen.dart';
import 'package:jobserve_ref/screens/inscription_screen.dart';
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

              decoration: InputDecoration(
                hintText: 'Adresse Mail',
                hintStyle: TextStyle(color: Colors.black54),
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
              decoration: InputDecoration(
                hintText: 'Mot de Passe',
                hintStyle: TextStyle(color: Colors.black54),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Colors.white),
                ),
              ),
              controller: passwordController,
              style: TextStyle(color: Colors.white),
            ),
          ),
          Container(
            alignment: Alignment.centerRight,
            child: TextButton(
                onPressed: () => _goToRegister(context),
                child: Text(
                    "Créer mon Entreprise",
                    style: TextStyle(color: Colors.brown)
                )
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: OutlinedButton(
                  onPressed: () => _goToA(context),
                  child: Text(
                      "Connexion",
                      style: TextStyle(color: Colors.white)
                  )
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _goToA(BuildContext context) {
    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: HomeScreen(title: "Accueil")));
  }

  void _goToRegister(BuildContext context) {
    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: InscriptionScreen()));
  }
}