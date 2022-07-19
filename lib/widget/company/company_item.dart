import 'package:flutter/material.dart';
import 'package:jobserve_ref/models/company.dart';
import 'package:jobserve_ref/services/company_service.dart';
import 'package:jobserve_ref/utils/shared_preferences.dart';

class CompanyItem extends StatefulWidget {
  const CompanyItem({Key? key, required this.company}) : super(key: key);

  final Company company;

  @override
  State<CompanyItem> createState() => _CompanyItemState();
}

class _CompanyItemState extends State<CompanyItem> {
  bool isModify = false;

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final nameController = TextEditingController(text: '${widget.company.name}');
    final adressController = TextEditingController(text: '${widget.company.address}');
    final cityController = TextEditingController(text: '${widget.company.city}');
    final zipCodeController = TextEditingController(text: '${widget.company.zipcode}');
    final siretController = TextEditingController(text: '${widget.company.siretNumber}');
    final capacityController = TextEditingController(text: '${widget.company.capacity}');

    return SizedBox(
      child: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 18),
                  child: Row(
                    children: [
                      if(UserSharedPreferences.getValue('permission') == "admin") ... [
                      Spacer(),
                      TextButton.icon(
                          onPressed: _enableUpdate,
                          icon: Icon(
                            Icons.create_rounded,
                            size: 24.0,
                            semanticLabel: 'pencil',
                          ),
                          label: Text("Modifier l'entreprise")),
                      SizedBox(),
                      ]
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    TextFormField(
                      controller: nameController,
                      enabled: isModify,
                      decoration: InputDecoration(
                        labelText: "Nom",
                      ),
                    ),
                    TextFormField(
                      controller: siretController,
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: "Numéro de Siret",
                      ),
                    ),
                    TextFormField(
                      controller: capacityController,
                      enabled: false,
                      decoration: InputDecoration(
                        labelText: "Capacité",
                      ),
                    ),
                    TextFormField(
                      controller: adressController,
                      enabled: isModify,
                      decoration: InputDecoration(
                        labelText: "Adresse",
                      ),
                    ),
                    TextFormField(
                      controller: cityController,
                      enabled: isModify,
                      decoration: InputDecoration(
                        labelText: "Ville",
                      ),
                    ),
                    TextFormField(
                      controller: zipCodeController,
                      enabled: isModify,
                      decoration: InputDecoration(
                        labelText: "Code Postal",
                      ),
                    ),
                    isModify
                        ? TextButton(
                      onPressed: () => {
                        if (_formKey.currentState!.validate())
                          {
                            _updateCompany(
                                widget.company.id,
                                nameController.text,
                                adressController.text,
                                cityController.text,
                                zipCodeController.text)
                          }
                        else
                          {
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text(
                                    'Veuillez remplir tous les champs'),
                              ),
                            ),
                          }
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Text(
                          "Modifier l'entreprise",
                          style: TextStyle(
                              fontSize: 20, color: Colors.pink),
                        ),
                      ),
                    )
                        : Text("")
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _updateCompany(String id,String name,String address,String city,String zipcode) async {
    CompanyServices.updateCompany(id,name, address, city, zipcode).then((value) => shownMessage(context, 'Entreprise modifié'))
    ;
  }
  void _enableUpdate() {
    setState(() {
      isModify = !isModify;
    });
  }
   String shownMessage(context, value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${value}')),
    );
    return '';
  }
}