import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:jobserve_ref/screens/connexion_screen.dart';
import 'package:jobserve_ref/screens/users.dart';
import 'package:jobserve_ref/widget/user/user_detail.dart';
import 'package:jobserve_ref/models/user_model.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  await Hive.deleteBoxFromDisk('users_box');
  await Hive.openBox('users_box');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate
        ],
        supportedLocales: [
          const Locale('en'),
          const Locale('fr')
        ],
      title: 'Flutter Web ',
      theme: ThemeData(
        primaryColor: jPrimaryColor,
      ),
      //home: const ConnexionScreen(),
      home: const Users_Screen(title: "User"),
          onGenerateRoute: (RouteSettings settings) {
          final dynamic arguments = settings.arguments;
          switch (settings.name) {
            case Card_User.routeName:
              User? identifier;
              if (arguments is User) {
                identifier = arguments;
              }
              return MaterialPageRoute(
                builder: (BuildContext context) => Card_User(
                  user: identifier ??
                      User("NULL","NULL", "NULL", "NULL", "NULL", "NULL",
                          "NULL", "NULL","NULL","NULL","NULL"),
                ),
              );
          }
        }
    );
  }
}

