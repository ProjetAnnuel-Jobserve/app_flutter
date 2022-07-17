import 'package:jobserve_ref/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserSharedPreferences {

  static late SharedPreferences preferences;

  static Future initPref() async => preferences = await SharedPreferences.getInstance();

  static Future setUser(UserApp user, String? token) async => {
    await preferences.setString('id', user.id),
    await preferences.setString('firstname', user.firstname),
    await preferences.setString('lastname', user.lastname),
    await preferences.setString('birthDate', user.birthDate),
    await preferences.setString('address', user.address),
    await preferences.setString('email', user.email),
    await preferences.setString('phoneNumber', user.phoneNumber),
    await preferences.setString('job', user.job),
    await preferences.setString('permission', user.permission),
    await preferences.setString('idFirebase', user.idFirebase),
    await preferences.setString('idCompany', user.idCompany),
    await preferences.setString('token', token != null ? token : '')
  };

  static String? getValue(String key) => preferences.getString('${key}') != null ? preferences.getString('${key}') : "pas de ${key}"; 

  static removePreferences() async => await preferences.clear(); 

}