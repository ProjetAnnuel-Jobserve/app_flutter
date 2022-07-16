class Company {
  final String? name;
  final String? description;
  final String? dateEnded;
  final String? status;

  Company(this.name, this.description, this.dateEnded, this.status,);

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        json["name"],
        json["description"],
        json["dateEnded"],
        json["status"]);
  }
}