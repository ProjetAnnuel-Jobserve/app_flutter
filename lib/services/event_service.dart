import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/event.dart';

class EventServices {
  static Future<List<Event>> getEvents() async {
    final response = await http.get(
      Uri.parse("https://jobserve-moc.herokuapp.com/events"),
    );

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<Event> events = [];
    events.addAll((jsonBody as List)
        .map((event) => Event.fromJson(event))
        .toList());
    return events;
  }
}
