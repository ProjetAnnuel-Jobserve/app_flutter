

import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:jobserve_ref/navigation/routes.dart';
import '../../services/firebase_auth_service.dart';

class SignIn extends StatelessWidget {
  const SignIn({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final mailController = TextEditingController();
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
              controller: mailController,
              style: TextStyle(color: Colors.white),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.lock,
              color: lightgrey,
            ),
            title: TextFormField(
              obscureText: true,
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
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
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
              Container(
                alignment: Alignment.centerLeft,
                child: TextButton(
                    onPressed: () => _newPassword(mailController.text),
                    child: Text(
                        "Mot de Passe Oublié",
                        style: TextStyle(color: Colors.brown)
                    )
                ),
              ),
            ],
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(80.0),
              child: OutlinedButton(
                  onPressed: () => _signIn(context, mailController.text, passwordController.text),
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

  void _goToRegister(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.inscription);
  }

  void _signIn(context, login, password) {
    if(login == '' || password == ''){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Veuillez remplir les champs')),
      );
    } else {
      FirebaseAuthService.signIn(context, login, password);
    }
  }

  void _newPassword(login) {
    FirebaseAuthService.forgotPassword(login);
  }
}