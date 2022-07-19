import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobserve_ref/services/user_service.dart';

import '../../utils/shared_preferences.dart';

class add_user extends StatefulWidget {
  final String idCompany;

  const add_user({Key? key, required this.idCompany}) : super(key: key);


  @override
  State<add_user> createState() => _add_userState();
}

class _add_userState extends State<add_user> {
  @override

  String dropdownValue = 'user';

  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final lastnameController = TextEditingController();
    final firstnameController = TextEditingController();
    final mailController = TextEditingController();
    final passwordController = TextEditingController();
    final birthDateController = TextEditingController();
    final numberController = TextEditingController();
    final addressController = TextEditingController();
    final jobController = TextEditingController();



    return Scaffold(
      appBar: AppBar(
        title: Text("Creer un utilisateur "),
      ),
      body: Container(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Expanded(
                child: SizedBox(
                  height: 450,
                  child: Column(
                    children: [
                      DropdownButton<String>(
                        value: dropdownValue,
                        icon: const Icon(Icons.arrow_downward),
                        elevation: 16,
                        style: const TextStyle(color: Colors.pink),
                        underline: Container(
                          height: 2,
                          color: Colors.pink,
                        ),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownValue = newValue!;
                          });
                        },
                        items: <String>['user', 'modo', 'admin']
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                      ),
                  ListTile(
                  leading: Icon(
                  Icons.account_circle,
                    color: Colors.pink,
                  ),
                  title: TextFormField(
                    keyboardType: TextInputType.phone,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Nom',
                      hintStyle: TextStyle(color: Colors.black54),
                      errorStyle: TextStyle(
                        fontSize: 0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                    controller: lastnameController,
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.account_circle,
                    color: Colors.pink,
                  ),
                  title: TextFormField(
                    keyboardType: TextInputType.datetime,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'error';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Prénom',
                      hintStyle: TextStyle(color: Colors.black54),
                      errorStyle: TextStyle(
                        fontSize: 0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                    controller: firstnameController,
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.alternate_email,
                    color: Colors.pink,
                  ),
                  title: TextFormField(
                    keyboardType: TextInputType.emailAddress,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'E-mail',
                      hintStyle: TextStyle(color: Colors.black54),
                      errorStyle: TextStyle(
                        fontSize: 0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                    controller: mailController,
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.lock,
                    color: Colors.pink,
                  ),
                  title: TextFormField(
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Mot de Passe',
                      hintStyle: TextStyle(color: Colors.black54),
                      errorStyle: TextStyle(
                        fontSize: 0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                    controller: passwordController,
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.date_range,
                    color: Colors.pink,
                  ),
                  title: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error';
                      }
                      return null;
                    },
                    controller: birthDateController,
                    //editing controller of this TextField
                    decoration: InputDecoration(
                      hintText: 'Date',
                      hintStyle: TextStyle(color: Colors.grey),
                      errorStyle: TextStyle(
                        fontSize: 0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                    readOnly: true,
                    //set it true, so that user will not able to edit text
                    onTap: () async {
                      DateTime? pickedDate = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          //DateTime.now() - not to allow to choose before today.
                          lastDate: DateTime.now());
                      if (pickedDate != null) {
                        String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                        birthDateController.text = formattedDate;
                      }
                    },
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.numbers,
                    color: Colors.pink,
                  ),
                  title: TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Numéro de téléphone',
                      hintStyle: TextStyle(color: Colors.black54),
                      errorStyle: TextStyle(
                        fontSize: 0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                    controller: numberController,
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.home,
                    color: Colors.pink,
                  ),
                  title: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'error';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Adresse',
                      hintStyle: TextStyle(color: Colors.black54),
                      errorStyle: TextStyle(
                        fontSize: 0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                    controller: addressController,
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
                ListTile(
                  leading: Icon(
                    Icons.wallet_travel,
                    color: Colors.pink,
                  ),
                  title: TextFormField(
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Error';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      hintText: 'Profession',
                      hintStyle: TextStyle(color: Colors.black54),
                      errorStyle: TextStyle(
                        fontSize: 0,
                      ),
                      focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: Colors.pink),
                      ),
                    ),
                    controller: jobController,
                    style: TextStyle(color: Colors.pink),
                  ),
                ),
                SizedBox(
                width: 30,
                height: 30,
              ),
              TextButton(
                onPressed: () =>
                {
                  if (_formKey.currentState!.validate())
                    {
                     // print("dropdown value = $dropdownValue")
                      _addUser(firstnameController.text,lastnameController.text,birthDateController.text,addressController.text,mailController.text,numberController.text,jobController.text,dropdownValue,"a")
                      //UserServices.add_user(firstnameController.text,lastnameController.text,birthDateController.text,addressController.text,mailController.text,numberController.text,jobController.text,dropdownValue,"a",UserSharedPreferences.getValue('idCompany')!)
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
                child: Text(
                  "Ajouter l'utilisateur",
                  style: TextStyle(fontSize: 20, color: Colors.pink),
                ),
              ),
            ],
          ),
        ),
      )
      ],
    ),)
    ,
    )
    ,
    );
  }
  void _addUser(String firstname,String lastname,String birthdate,String address,String mail, String phone,String job, String permission, String idFirebase) async {
    //UserServices.deleteUser(widget.user.id).then((value) => Navigator.pop(context));
    UserServices.add_user(firstname,lastname,birthdate,address,mail,phone,job,permission,"a",UserSharedPreferences.getValue('idCompany')!).then((value) => Navigator.pop(context));
  }
}

class typeUser extends StatefulWidget {
  const typeUser({Key? key}) : super(key: key);

  @override
  State<typeUser> createState() => _typeUserState();
}

class _typeUserState extends State<typeUser> {
  String dropdownValue = 'user';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      elevation: 16,
      style: const TextStyle(color: Colors.pink),
      underline: Container(
        height: 2,
        color: Colors.pink,
      ),
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>['user', 'modo', 'admin']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

