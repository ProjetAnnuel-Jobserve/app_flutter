import 'package:flutter/material.dart';

class ProfileItem extends StatelessWidget {
  const ProfileItem({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3),
              ),
            ],
          ),
        alignment: Alignment.center,
        child: 
           Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                color: Colors.blueAccent,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(12), bottomLeft: Radius.circular(12))
                )
              ),
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
                title: Text('Adresse'),
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
    );
  }
}