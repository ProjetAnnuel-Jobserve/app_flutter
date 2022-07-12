import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:jobserve_ref/screens/connexion_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Web ',
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

