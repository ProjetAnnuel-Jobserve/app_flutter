import 'package:flutter/material.dart';
import 'package:jobserve_ref/models/user_model.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobserve_ref/screens/add_user.dart';

class UserServices {
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
        'location': user.adress
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

