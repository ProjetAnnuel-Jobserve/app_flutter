import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:jobserve_ref/models/user.dart';
import 'package:jobserve_ref/navigation/routes.dart';
import 'package:jobserve_ref/services/user_service.dart';
import 'package:jobserve_ref/utils/shared_preferences.dart';

class FirebaseAuthService {

  static Future<String> signUp(context, emailAdress, password) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: emailAdress,
        password: password,
      );

      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAdress,
        password: password
      );

      final dynamic user = await FirebaseAuth.instance.currentUser;
      if(user.uid != null){
        return user.uid;
      } else {
        return '';
      }

    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        return shownMessage(context, 'Votre mot de passe n\'est pas assez sécurisé.');
      } else if (e.code == 'email-already-in-use') {
        return shownMessage(context, 'Un compte existe déjà pour ce mail.');
      } else if (e.code == 'invalid-email') {
        return shownMessage(context, 'Le format de mail n\'est pas valide.');
      } else {
        return '';
      }
    } catch (e) {
      return '';
    }
  }

  static signIn(context, emailAdress, password) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailAdress,
        password: password
      );
      final dynamic user = await FirebaseAuth.instance.currentUser;
      final UserApp userApp = await UserServices.getUserbyIdFirebase(user.uid);
      if(userApp.permission == 'admin' || userApp.permission == 'modo'){
        FirebaseAuthService.storeUserAndToken(userApp).then((value) => Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false));
      }else{
        return shownMessage(context, 'Cet Utilisateur n\'est pas autorisé à se connecter.');
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        return shownMessage(context, 'Ce mail n\'existe pas.');
      } else if (e.code == 'wrong-password') {
        return shownMessage(context, 'Mot de passe incorrect.');
      }
    }
  }

  static logout(context) async {
    await FirebaseAuth.instance.signOut();
    UserSharedPreferences.removePreferences();
    Navigator.pushNamedAndRemoveUntil(context, RoutesName.connexion, (route) => false);
  }

  static forgotPassword(mail) async {
    await FirebaseAuth.instance.sendPasswordResetEmail(email: mail);
  }

  static Future storeUserAndToken(UserApp user) async {
    final token = await FirebaseAuth.instance.currentUser?.getIdToken();
    await UserSharedPreferences.setUser(user, token);
    return;

  }

  static String shownMessage(context, value) {
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('${value}')),
    );
    return '';
  }


}