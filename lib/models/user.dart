class User {
  final String firstname;
  final String lastname;
  final String birthDate;
  final String address;
  final String email;
  final String phoneNumber;
  final String job;
  final String permission;
  final String idFirebase;
  final String idCompany;

  User(this.firstname, this.lastname, this.birthDate, this.address, this.email, this.phoneNumber, this.job,this.permission,this.idFirebase,this.idCompany);

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        json["firstname"],
        json["lastname"],
        json["birthDate"],
        json["location"],
        json["email"],
        json["phoneNumber"],
        json["job"],
        json["permission"],
        json["idFirebase"],
        json["fk_company"]);
  }
}