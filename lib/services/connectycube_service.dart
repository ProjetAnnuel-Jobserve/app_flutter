



import 'package:connectycube_sdk/connectycube_sdk.dart';


class CompanyServices {

  createConnectyUser() {
    CubeUser user = CubeUser(
    login: 'marvin18',
    password: 'supersecurepwd',
    email: 'awesomeman@gmail.com',
    fullName: 'Marvin Simon',
    phone: '47802323143',
    website: 'https://dozensofdreams.com',
    customData: "{middle_name: 'Bartoleo'}");

    signUp(user)
      .then((cubeUser) {})
      .catchError((error){});
  }

  connectConnectyUser(CubeUser user) {
    signIn(user)
      .then((cubeUser) {})
      .catchError((error){});
  }

  resetConnectyPassword(mail) {
    resetPassword(mail)
      .then((voidResult) {})
      .catchError((error) {});
  }

  logout(){
    signOut()
    .then((voidResult) {})
    .catchError((error) {});
  }

}