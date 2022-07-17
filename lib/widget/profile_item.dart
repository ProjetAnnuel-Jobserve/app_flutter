import 'package:flutter/material.dart';

import '../utils/shared_preferences.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: 
           Center(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: Text('Nom'),
                  subtitle: Text('${UserSharedPreferences.getValue('lastname')}'),
                ),
                ListTile(
                  title: Text('Prenom'),
                  subtitle: Text('${UserSharedPreferences.getValue('firstname')}'),
                ),
                ListTile(
                  title: Text('Date de Naissance'),
                  subtitle: Text('${UserSharedPreferences.getValue('birthDate')}'),
                ),
                ListTile(
                  title: Text('Mail'),
                  subtitle: Text('${UserSharedPreferences.getValue('email')}'),
                ),
                ListTile(
                  title: Text('adresse'),
                  subtitle: Text('${UserSharedPreferences.getValue('address')}'),
                ),
                ListTile(
                  title: Text('Téléphone'),
                  subtitle: Text('${UserSharedPreferences.getValue('phoneNumber')}'),
                ),
                ListTile(
                  title: Text('Profession'),
                  subtitle: Text('${UserSharedPreferences.getValue('job')}'),
                )
              ]),
           ),
        ),
    );
  }
}