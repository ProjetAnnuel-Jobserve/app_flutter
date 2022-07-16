import 'dart:convert';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:jobserve_ref/models/user.dart';

class UserServices {

  final userBox = Hive.box('users_box');

  static Future<List<User>> getUsers() async {
    final response = await http.get(
      Uri.parse("https://jobserve-moc.herokuapp.com/users"),
    );
    if (response.statusCode != 200) {
      print("Erreur URL");
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<User> users = [];
    users.addAll((jsonBody as List)
        .map((user) => User.fromJson(user))
        .toList());
    return users;
  }
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

  static Future<http.Response> deleteUser(String id) async {
    final http.Response response = await http.delete(
      Uri.parse("https://jobserve-moc.herokuapp.com/users/$id"),
    );
    if (response.statusCode != 200) {
      print("Erreur URL");
      throw Error();
    }
    return response;

  }
  static Future<http.Response> updateUser(User user) {
    return http.put(
      Uri.parse('https://jobserve-moc.herokuapp.com/users-one'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        '_id':user.id,
        'permission': user.permission,
        'job': user.job,
        'phoneNumber': user.phoneNumber,
        'location': user.address
      }),
    );
  }

  static Future<http.Response> add_user(String firstname,String lastname,String birthDate,String adress,String email,String phoneNumber,String job,String permission,String idFirebase,String idCompany) {
    return http.post(
      Uri.parse('https://jobserve-moc.herokuapp.com/users'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
        'firstname': firstname,
        'lastname': lastname,
        'birthDate': birthDate,
        'location': adress,
        'email': email,
        'phoneNumber': phoneNumber,
        'job': job,
        'permission': permission,
        'idFirebase': idFirebase,
        'fk_company': idCompany,
      }),
    );
  }

}