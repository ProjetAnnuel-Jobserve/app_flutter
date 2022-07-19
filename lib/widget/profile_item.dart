import 'package:flutter/material.dart';

import '../services/firebase_auth_service.dart';
import '../services/user_service.dart';
import '../utils/shared_preferences.dart';
import 'package:jobserve_ref/models/user.dart';

class ProfileItem extends StatefulWidget {
  final UserApp profil;
  const ProfileItem({Key? key, required this.profil}) : super(key: key);


  @override
  State<ProfileItem> createState() => _ProfileItemState();
}

class _ProfileItemState extends State<ProfileItem> {
  bool isModify = false;

  @override



  Widget build(BuildContext context) {
    String id = widget.profil.id;
    String typeUser = widget.profil.permission
    ;
    final _formKey = GlobalKey<FormState>();
    final numberController = TextEditingController(
        text: widget.profil.phoneNumber);
    final addressController = TextEditingController(
        text: widget.profil.address);
    final jobController =
        TextEditingController(text: widget.profil.job);

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
                        label: Text("Modifier l'utilisateur")),
                    SizedBox(
                      width: 20,
                      height: 20,
                    ),
                  ],
                ),
                Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ListTile(
                        title: Text('Nom'),
                        subtitle: Text(
                            widget.profil.lastname),
                      ),
                      ListTile(
                        title: Text('Prenom'),
                        subtitle: Text(
                            widget.profil.firstname),
                      ),
                      ListTile(
                        title: Text('Date de Naissance'),
                        subtitle: Text(
                            widget.profil.birthDate),
                      ),
                      ListTile(
                        title: Text('Mail'),
                        subtitle:
                            Text(widget.profil.email),
                      ),
                      TextFormField(
                        controller: addressController,
                        enabled: isModify,
                        //  initialValue: widget.user.address,
                        decoration: InputDecoration(
                          labelText: "Adresse",
                        ),
                      ),
                      TextFormField(
                        controller: numberController,
                        keyboardType: TextInputType.phone,
                        enabled: isModify,
                        // initialValue: widget.user.phoneNumber,
                        decoration: InputDecoration(
                          labelText: "Telephone",
                        ),
                      ),
                      TextFormField(
                        controller: jobController,
                        enabled: isModify,
                        decoration: InputDecoration(
                          labelText: "Poste",
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      isModify
                          ? TextButton(
                              onPressed: () => {
                                if (_formKey.currentState!.validate())
                                  {
                                    //print("user : id ${widget.user.id}, ${jobController.text},`${numberController.text}, ${addressController.text}, ${typeUser}")
                                    _updateUser(
                                        id,
                                        typeUser,
                                        jobController.text,
                                        numberController.text,
                                        addressController.text)
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
                                  "Modifier l'utilisateur",
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

  void _enableUpdate() {
    setState(() {
      isModify = !isModify;
    });
  }

  void _updateUser(String id, String typeUser, String job, String number,
      String address) async {
    UserServices.updateUser(id, typeUser, job, number, address).then((value) => shownMessage(context, 'User modifié'))
    ;
  }
  static String shownMessage(context, value) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('${value}')),
    );
    return '';
  }
}
