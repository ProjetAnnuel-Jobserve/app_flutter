import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:jobserve_ref/navigation/routes.dart';
import 'package:jobserve_ref/navigation/routes_generator.dart';
import 'package:jobserve_ref/screens/authentification/inscription_screen.dart';
import 'package:jobserve_ref/screens/home_screen.dart';
import 'package:jobserve_ref/utils/pref_util.dart';
import 'package:jobserve_ref/utils/shared_preferences.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:jobserve_ref/screens/authentification/connexion_screen.dart';
import 'package:connectycube_sdk/connectycube_sdk.dart';
import 'package:jobserve_ref/utils/configs.dart' as config;
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_web_plugins/flutter_web_plugins.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserSharedPreferences.initPref();
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
  );
  FirebaseAuth.instance
    .idTokenChanges()
    .listen((User? user) {
      if (user == null) {
        print('User is currently signed out!');
        UserSharedPreferences.removePreferences();
      } else {
        print('User is signed in!');
      }
    });
    setUrlStrategy(PathUrlStrategy());
    runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
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
      title: 'Jobserve',
      theme: ThemeData(
        primaryColor: jPrimaryColor,
        colorScheme: ThemeData.light().colorScheme.copyWith(
          onPrimary: Colors.white, // Color for checkmark in datatable
          primary: jPrimaryColor, // Color used for checkbox fill in datatable
        ),
      ),
      //home: ConnexionScreen(),
      //builder: (context, child) => HomePage(child: child),
      onGenerateRoute: RouteGenerator.generateRoute,
      initialRoute: RoutesName.connexion,
    );
  }

  @override
  void initState() {
    super.initState();
    initConnectycube();
  }
}

initConnectycube() {
  init(
    config.APP_ID,
    config.AUTH_KEY,
    config.AUTH_SECRET,
    onSessionRestore: () {
      return SharedPrefs.getUser().then((savedUser) {
        return createSession(savedUser);
      });
    },
  );
}

