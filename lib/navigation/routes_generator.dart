import 'package:flutter/material.dart';
import 'package:jobserve_ref/navigation/routes.dart';
import 'package:jobserve_ref/screens/authentification/connexion_screen.dart';
import 'package:jobserve_ref/screens/authentification/inscription_screen.dart';
import 'package:jobserve_ref/screens/home_screen.dart';
import 'package:jobserve_ref/utils/shared_preferences.dart';

class _GeneratePageRoute extends PageRouteBuilder {
  final Widget widget;
  final String? routeName;
  _GeneratePageRoute({required this.widget, this.routeName})
      : super(
            settings: RouteSettings(name: routeName),
            pageBuilder: (BuildContext context, Animation<double> animation,
                Animation<double> secondaryAnimation) {
              return widget;
            }
      );
}

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    if(UserSharedPreferences.getValue('idFirebase') != "pas d'information"){
      switch (settings.name) {
        case RoutesName.connexion:
          return _GeneratePageRoute(
              widget: ConnexionScreen(), routeName: settings.name);
        case RoutesName.inscription:
          return _GeneratePageRoute(
              widget: InscriptionScreen(), routeName: settings.name);
        case RoutesName.home:
          return _GeneratePageRoute(
              widget: HomeScreen(), routeName: settings.name);
        case RoutesName.users:
          return _GeneratePageRoute(
              widget: HomeScreen(), routeName: settings.name);
        case RoutesName.conferences:
          return _GeneratePageRoute(
              widget: HomeScreen(index: 1,), routeName: settings.name);
        case RoutesName.events:
          return _GeneratePageRoute(
              widget: HomeScreen(index: 2,), routeName: settings.name);
        case RoutesName.topics:
          return _GeneratePageRoute(
              widget: HomeScreen(index: 3,), routeName: settings.name);
        case RoutesName.company:
          return _GeneratePageRoute(
              widget: HomeScreen(index: 4,), routeName: settings.name);
        case RoutesName.profile:
          return _GeneratePageRoute(
              widget: HomeScreen(index: 5,), routeName: settings.name);
        default:
          return _GeneratePageRoute(
              widget: HomeScreen(), routeName: RoutesName.home);
      }
    } else {
      return _GeneratePageRoute(
          widget: ConnexionScreen(), routeName: settings.name);
    }
  }
}