import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobserve_ref/screens/connexion_screen.dart';
import 'package:page_transition/page_transition.dart';

import '../screens/home_screen.dart';

class FirebaseAuthService {
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


}