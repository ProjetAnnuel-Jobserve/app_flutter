import 'package:flutter/material.dart';
import 'package:jobserve_ref/services/user_service.dart';
import 'package:jobserve_ref/models/user.dart';
import 'package:jobserve_ref/utils/shared_preferences.dart';

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
    final numberController = TextEditingController(text: widget.profil.phoneNumber);
    final addressController = TextEditingController(text: widget.profil.address);
    final jobController = TextEditingController(text: widget.profil.job);
    final lastnameController = TextEditingController(text: widget.profil.lastname);
    final firstnameController = TextEditingController(text: widget.profil.firstname);
    final birthdateController = TextEditingController(text: widget.profil.birthDate);
    final mailController = TextEditingController(text: widget.profil.email);

    return SizedBox(
      child: Container(
        child: Center(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Row(
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
                        label: Text("Modifier l'utilisateur")),
                    SizedBox(
                      width: 20,
                      height: 20,
                    ),
                    ]
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        TextFormField(
                          controller: lastnameController,
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: "Nom",
                          ),
                        ),
                        TextFormField(
                          controller: firstnameController,
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: "Prénom",
                          ),
                        ),
                        TextFormField(
                          controller: birthdateController,
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: "Date de Naissance",
                          ),
                        ),
                        TextFormField(
                          controller: mailController,
                          enabled: false,
                          decoration: InputDecoration(
                            labelText: "Mail",
                          ),
                        ),
                        TextFormField(
                          controller: addressController,
                          enabled: isModify,
                          decoration: InputDecoration(
                            labelText: "Adresse",
                          ),
                        ),
                        TextFormField(
                          controller: numberController,
                          keyboardType: TextInputType.phone,
                          enabled: isModify,
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
                                      _updateUser(
                                          id,
                                          typeUser,
                                          jobController.text,
                                          numberController.text,
                                          addressController.text)
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
                ),
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