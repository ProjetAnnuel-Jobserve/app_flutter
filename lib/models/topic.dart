class Topic {
  final String? name;
  final String? description;
  final String? dateEnded;
  final String? status;

  Topic(this.name, this.description, this.dateEnded, this.status,);

  factory Topic.fromJson(Map<String, dynamic> json) {
    return Topic(
        json["name"],
        json["description"],
        json["dateEnded"],
        json["status"]);
  }
}