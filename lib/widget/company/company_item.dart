import 'package:flutter/material.dart';
import 'package:jobserve_ref/models/company.dart';


class CompanyItem extends StatefulWidget {
  const CompanyItem({Key? key, required this.company}) : super(key: key);
  final Company company;

  @override
  State<CompanyItem> createState() => _CompanyItemState();
}

class _CompanyItemState extends State<CompanyItem> {

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        child: 
           Center(
             child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ListTile(
                  title: Text('Nom'),
                  subtitle: Text('${widget.company.name}'),
                ),
                ListTile(
                  title: Text('Numéro de Siret'),
                  subtitle: Text('${widget.company.siretNumber}'),
                ),
                ListTile(
                  title: Text('Capacité'),
                  subtitle: Text('${widget.company.capacity}'),
                ),
                ListTile(
                  title: Text('Adresse'),
                  subtitle: Text('${widget.company.address}'),
                ),
                ListTile(
                  title: Text('Ville'),
                  subtitle: Text('${widget.company.city}'),
                ),
                ListTile(
                  title: Text('Code Postal'),
                  subtitle: Text('${widget.company.zipcode}'),
                ),
              ]),
           ),
        ),
    );
  }
}
