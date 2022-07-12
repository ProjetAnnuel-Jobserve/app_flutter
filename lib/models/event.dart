class Event {
  final String? name;
  final String? description;
  final String? dateInscription;
  final String? dateEnded;
  final String? location;
  final String? status;
  final List<dynamic>? participant;
  final List<dynamic>? review;
  final String? image;
  final String? idCompany;

  Event(this.name, this.description, this.dateInscription, this.dateEnded, this.location, this.status, this.participant,this.review,this.image,this.idCompany);

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
        json["name"],
        json["description"],
        json["dateInscription"],
        json["dateEnded"],
        json["location"],
        json["status"],
        json["participant"],
        json["review"],
        json["image"],
        json["fk_company"]);
  }
}