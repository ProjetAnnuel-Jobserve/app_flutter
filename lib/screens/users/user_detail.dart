import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:jobserve_ref/models/user.dart';
import 'package:jobserve_ref/services/user_service.dart';
import 'package:jobserve_ref/utils/shared_preferences.dart';

class Card_User extends StatefulWidget {

  final UserApp user;

  const Card_User({Key? key, required this.user}) : super(key: key);

  @override
  State<Card_User> createState() => _Card_UserState();
}

class _Card_UserState extends State<Card_User> {
  bool isModify = false;


  @override
  void initState() {
    super.initState();
  }

  @override
  String typeUser = "user";
  Widget build(BuildContext context) {


    final _formKey = GlobalKey<FormState>();
    final numberController = TextEditingController(text: widget.user.phoneNumber);
    final addressController = TextEditingController(text: widget.user.address);
    final jobController = TextEditingController(text: widget.user.job);

    return Scaffold(
      appBar: AppBar(
        title: Text("Détail de l'utilisateur"),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        alignment: Alignment.topLeft,
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
                    SizedBox(),
                    TextButton.icon(
                      onPressed: () {
                        showAlert(context);
                      },
                      icon: Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 24.0,
                        semanticLabel: 'Trash bin red',
                      ),
                      label: Text(
                        "Supprimer l'utilisateur",
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                    ],
                  ],
                ),
                SizedBox(
                  width: 400,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                          contentPadding: EdgeInsets.only(left: 0.0),
                          title: Text('Nom Prénom'),
                          subtitle: Text(
                              "${widget.user.lastname} ${widget.user.firstname}")),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 0.0),
                        title: Text('Date de Naissance'),
                        subtitle: Text("${widget.user.birthDate}"),
                      ),
                      ListTile(
                        contentPadding: EdgeInsets.only(left: 0.0),
                        title: Text('Mail'),
                        subtitle: Text("${widget.user.email}"),
                      ),
                      TextFormField(
                        controller: addressController,
                        enabled: isModify,
                        decoration: InputDecoration(
                          labelText: "Adresse",
                        ),
                      ),
                      TextFormField(
                        inputFormatters: [ FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
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
                        height: 30,
                      ),
                      Text("Permission",style: TextStyle(fontSize: 18),),
                      SizedBox(
                        height: 20,
                      ),
                      isModify
                          ? DropdownButton<String>(
                              value: typeUser,
                              onChanged: (String? newValue) {
                                setState(() {
                                   typeUser = newValue!;
                                });
                              },
                              items: <String>["user", "modo", "admin"]
                                  .map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(value),
                                );
                              }).toList(),
                            )
                          : Text(
                              '${widget.user.permission}',
                            ),
                      isModify ? TextButton(
                        onPressed: () =>
                        {
                          if (_formKey.currentState!.validate())
                            {
                              _updateUser(widget.user.id,typeUser, jobController.text, numberController.text, addressController.text)
                            }
                          else
                            {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content:
                                  Text('Veuillez remplir tous les champs'),
                                ),
                              ),
                            }
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "Modifier l'utilisateur",
                            style: TextStyle(fontSize: 20, color: Colors.pink),
                          ),
                        ),
                      ) : Text("")
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );


  }
  void _updateUser(String id,String typeUser,String job,String number,String address) async {
    UserServices.updateUser(id,typeUser, job, number, address).then((value) => Navigator.pop(context));;
  }
  showAlert(BuildContext context) {
    Widget cancelButton = TextButton(
      child: Text("Annuler"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    Widget continueButton = TextButton(
      child: Text(
        "Supprimer l'utilisateur",
        style: TextStyle(color: Colors.red),
      ),
      onPressed: () {
        _deleteUser();
        Navigator.of(context).pop();
      },
    );
    AlertDialog alert = AlertDialog(
      title: Text("Supprimer l'utilisateur"),
      content: Text("Etes-vous sur de vouloir supprimer cet utilisateur ?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }

  void _deleteUser() async {
    UserServices.deleteUser(widget.user.id).then((value) => Navigator.pop(context));
  }

  void _enableUpdate() {
    setState(() {
      isModify = !isModify;
    });
  }
}