import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:jobserve_ref/screens/connexion_screen.dart';
import 'package:hive_flutter/hive_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.openBox('user_box');
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance
    .idTokenChanges()
    .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
      } else {
        print('User is signed in!');
      }
    });
    runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Jobserve',
      theme: ThemeData(
        primaryColor: jPrimaryColor,
        colorScheme: ThemeData.light().colorScheme.copyWith(
          onPrimary: Colors.white, // Color for checkmark in datatable
          primary: jPrimaryColor, // Color used for checkbox fill in datatable
        ),
      ),
      home: const ConnexionScreen(),
    );
  }
}

