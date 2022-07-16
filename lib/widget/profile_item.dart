import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.center,
        child: 
           Center(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: Text('Nom'),
                  subtitle: Text('Here is a second line'),
                ),
                ListTile(
                  title: Text('Prenom'),
                  subtitle: Text('Here is a second line'),
                ),
                ListTile(
                  title: Text('Date de Naissance'),
                  subtitle: Text('Here is a second line'),
                ),
                ListTile(
                  title: Text('Mail'),
                  subtitle: Text('Here is a second line'),
                ),
                ListTile(
                  title: Text('adresse'),
                  subtitle: Text('Here is a second line'),
                ),
                ListTile(
                  title: Text('Téléphone'),
                  subtitle: Text('Here is a second line'),
                ),
                ListTile(
                  title: Text('Profession'),
                  subtitle: Text('Here is a second line'),
                )
              ]),
           ),
        ),
    );
  }
}