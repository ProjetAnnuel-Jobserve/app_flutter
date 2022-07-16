import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/company.dart';

class CompanyServices {
  static Future<List<Company>> getCompanys() async {
    final response = await http.get(
      Uri.parse("https://jobserve-moc.herokuapp.com/companys"),
    );

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<Company> companys = [];
    companys.addAll((jsonBody as List)
        .map((company) => Company.fromJson(company))
        .toList());
    return companys;
  }

  static Future<Company> createCompany(name, siret, capacity, address, city, zip) async {

    print('capacity :  ${capacity}');
    final response = await  http.post(
      Uri.parse('https://jobserve-moc.herokuapp.com/companys'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'name': name,
        'siretNumber': siret,
        'capacity': int.parse(capacity),
        'address': address,
        'city': city,
        'zipcode': zip,
      }),
    );

    if (response.statusCode == 200) {
      print("Entreprise crée et recu");
      return Company.fromJson(jsonDecode(response.body));
    } else {
      throw Exception('L\'entreprise n\'a pas été crée');
    }
  }

}
