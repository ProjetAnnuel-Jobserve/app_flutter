import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobserve_ref/screens/connexion_screen.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../screens/home_screen.dart';

class FirebaseAuthService {

  late SharedPreferences _shared;

  static signUp(emailAdress, password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAdress,
        password: password,
      );


    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      } else if (e.code == 'invalid-email') {
        print('The account already exists for that email.');
      }
    } catch (e) {
    print(e);
    }
  }

  static signIn(context, emailAdress, password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAdress,
        password: password
      );
      final dynamic user = await FirebaseAuth.instance.currentUser;
      print("user ${user.uid}");
      Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: HomeScreen(title: "Accueil")));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  static logout(context) async {
    await FirebaseAuth.instance.signOut();
    Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: ConnexionScreen()));
  }

  static forgotPassword(mail) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: mail);
  }

  storeIdAndToken(token, id) async {
    final dynamic user = await FirebaseAuth.instance.currentUser;
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    _shared = await SharedPreferences.getInstance();
    _shared.setString('token', token!);
    _shared.setString('id', user.uid);
    print(_shared.getString('token'));
    print(_shared.getString('id'));
  }


}