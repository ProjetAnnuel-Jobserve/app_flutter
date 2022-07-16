import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/company.dart';

class CompanyServices {
  static Future<List<Company>> getCompanys() async {
    final response = await http.get(
      Uri.parse("https://jobserve-moc.herokuapp.com/Companys"),
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
}
