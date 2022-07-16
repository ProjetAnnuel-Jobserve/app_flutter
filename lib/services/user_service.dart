import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:jobserve_ref/models/user.dart';

class UserServices {
  static Future<User> getUser() async {
    final response = await http.get(
      Uri.parse("https://jobserve-moc.herokuapp.com/topics"),
    );

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final User user = jsonBody as User;
    
    return user;
  }
}