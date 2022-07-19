import 'package:flutter/material.dart';
import 'package:jobserve_ref/models/company.dart';
import 'package:jobserve_ref/services/company_service.dart';

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

    return SizedBox(
      child: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
                  children: [
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
                  ],
                ),
                Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
                  TextFormField(
                    controller: nameController,
                    enabled: isModify,
                    decoration: InputDecoration(
                      labelText: "Nom",
                    ),
                  ),
                  ListTile(
                    title: Text('Numéro de Siret'),
                    subtitle: Text('${widget.company.siretNumber}'),
                  ),
                  ListTile(
                    title: Text('Capacité'),
                    subtitle: Text('${widget.company.capacity}'),
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
                          //print("user : id ${widget.user.id}, ${jobController.text},`${numberController.text}, ${addressController.text}, ${typeUser}")
                          _updateCompany(
                              widget.company.id,
                              nameController.text,
                              adressController.text,
                              cityController.text,
                              zipCodeController.text)
                          //  UserServices.updateUser(widget.user.id,typeUser, jobController.text, numberController.text, addressController.text)
                          //UserServices.add_user(firstnameController.text,lastnameController.text,birthDateController.text,addressController.text,mailController.text,numberController.text,jobController.text,dropdownValue,"a",UserSharedPreferences.getValue('idCompany')!)
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
