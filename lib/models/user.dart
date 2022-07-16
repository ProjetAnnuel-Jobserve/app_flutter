class User {
  final String id;
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

  User(this.id, this.firstname, this.lastname, this.birthDate, this.address, this.email, this.phoneNumber, this.job,this.permission,this.idFirebase,this.idCompany);

  factory User.fromJson(Map<String, dynamic> json) {
    String birthDateBrut = json["birthDate"];
    var birthdate = birthDateBrut.split('T')[0];
    return User(
        json["_id"],
        json["firstname"],
        json["lastname"],
        birthdate,
        json["location"],
        json["email"],
        json["phoneNumber"],
        json["job"],
        json["permission"],
        json["idFirebase"],
        json["fk_company"]);
  }
}