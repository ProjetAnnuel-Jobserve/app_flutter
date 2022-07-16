import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:jobserve_ref/models/user_model.dart';
import 'package:jobserve_ref/services/users_services.dart';

class add_user extends StatelessWidget {
  final String idCompany;

  const add_user({Key? key, required this.idCompany}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _formKey = GlobalKey<FormState>();
    final lastnameController = TextEditingController();
    final firstnameController = TextEditingController();
    final mailController = TextEditingController();
    final passwordController = TextEditingController();
    final birthDateController = TextEditingController();
    final numberController = TextEditingController();
    final jobController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: Text("Creer un utilisateur $idCompany"),
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
                        onPressed: () => {
                          if (_formKey.currentState!.validate())
                            {
                              UserServices.add_user(firstnameController.text,lastnameController.text,birthDateController.text,"Marseille",mailController.text,numberController.text,jobController.text,"user","a",idCompany)

                              // _register(context, lastnameController.text, firstnameController.text, mailController.text, passwordController.text, birthDateController.text,
                              // numberController.text, jobController.text,


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
          ),
        ),
      ),
    );
  }

}
