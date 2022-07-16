class Company {
  final String? id;
  final String? name;
  final String? siretNumber;
  final int? capacity;
  final String? address;
  final String? city;
  final String? zipcode;

  Company(this.id, this.name, this.siretNumber, this.capacity, this.address, this.city, this.zipcode,);

  factory Company.fromJson(Map<String, dynamic> json) {
    return Company(
        json["_id"],
        json["name"],
        json["siretNumber"],
        json["capacity"],
        json["address"],
        json["city"],
        json["zipcode"]);
  }
}