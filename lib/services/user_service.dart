import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobserve_ref/models/user.dart';

class UserServices {

  static Future<List<UserApp>> getUsers(String? idCompany) async {
    final response = await http.get(
      Uri.parse("https://jobserve-moc.herokuapp.com/users-company/${idCompany}"),
    );
    if (response.statusCode != 200) {
      print("Erreur URL");
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<UserApp> users = [];
    users.addAll((jsonBody as List)
        .map((user) => UserApp.fromJson(user))
        .toList());
    return users;
  }
  
  static Future<UserApp> getUserbyIdFirebase(String idFirebase) async {
    final response = await http.get(
      Uri.parse("https://jobserve-moc.herokuapp.com/users-firebase/${idFirebase}"),
    );

    if (response.statusCode != 200) {
      throw Error();
    }
    return UserApp.fromJson(jsonDecode(response.body));
  
  }

  static Future<UserApp> createAdmin(firstname, lastname, birthdate, location, email, phoneNumber, job, idFirebase, fk_company) async {

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
      return UserApp.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('L\'admin n\'a pas été crée');
    }
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
  static Future<http.Response> updateUser(String id,String permission,String job,String phoneNumber,String address ) {
    return http.put(
      Uri.parse('https://jobserve-moc.herokuapp.com/users-one'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, String>{
         '_id': id,
         'permission': permission,
         'job': job,
         'phoneNumber': phoneNumber,
         'location': address
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