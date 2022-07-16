import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/topic.dart';

class TopicServices {
  static Future<List<Topic>> getTopics() async {
    final response = await http.get(
      Uri.parse("https://jobserve-moc.herokuapp.com/topics"),
    );

    if (response.statusCode != 200) {
      throw Error();
    }
    final jsonBody = json.decode(response.body);
    final List<Topic> topics = [];
    topics.addAll((jsonBody as List)
        .map((topic) => Topic.fromJson(topic))
        .toList());
    return topics;
  }
}