import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:jobserve_ref/models/user.dart';

class UserServices {

  final userBox = Hive.box('users_box');

  static Future<User> getUser() async {
    final response = await http.get(
      Uri.parse("https://jobserve-moc.herokuapp.com/users"),
    );

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final User user = jsonBody as User;
    
    return user;
  }

  static Future<User> createAdmin(firstname, lastname, birthdate, location, email, phoneNumber, job, idFirebase, fk_company) async {

    print("create Admin");
    final response = await  http.post(
      Uri.parse('https://jobserve-moc.herokuapp.com/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstname': firstname,
        'lastname': lastname,
        'birthDate': birthdate,
        'location': location,
        'email': email,
        'phoneNumber': phoneNumber,
        'job': job,
        'permission': "admin",
        'idFirebase': idFirebase,
        'fk_company': fk_company,
      }),
    );

    if (response.statusCode == 200) {
      return User.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('L\'admin n\'a pas été crée');
    }
  }

  Future<void> storeUser(User currentUser) async {
    await userBox.add(currentUser);
  }

}