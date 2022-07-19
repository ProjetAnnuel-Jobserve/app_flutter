

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';
import 'package:jobserve_ref/navigation/routes.dart';
import 'package:jobserve_ref/services/company_service.dart';
import 'package:jobserve_ref/services/firebase_auth_service.dart';
import 'package:jobserve_ref/services/user_service.dart';

class SignUp extends StatelessWidget {
  const SignUp({ Key? key }) : super(key: key);
  

  @override
  Widget build(BuildContext context) {
    
    final _formKey = GlobalKey<FormState>();
    final lastnameController = TextEditingController();
    final firstnameController = TextEditingController();
    final mailController = TextEditingController();
    final passwordController = TextEditingController();
    final birthDateController = TextEditingController();
    final locationController = TextEditingController();
    final numberController = TextEditingController();
    final jobController = TextEditingController();
    final companyNameController = TextEditingController();
    final companySiretController = TextEditingController();
    final companyCapacityController = TextEditingController();
    final companyaddressController = TextEditingController();
    final companyCityController = TextEditingController();
    final companyZipController = TextEditingController();

    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: SizedBox(
                    height: 480,
                      child: Column(
                        children: [
                          Text("Informations personnelles",style: TextStyle(
                              color: Colors.white)),
                          ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            title: TextFormField(
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
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              controller: lastnameController,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.account_circle,
                              color: Colors.white,
                            ),
                            title: TextFormField(
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
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              controller: firstnameController,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.alternate_email,
                              color: Colors.white,
                            ),
                            title: TextFormField(
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
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              controller: mailController,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.lock,
                              color: Colors.white,
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
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              controller: passwordController,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.date_range,
                              color: Colors.white,
                            ),
                            title: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Error';
                                }
                                return null;
                              },
                              controller: birthDateController,
                              style: TextStyle(color: Colors.white),
                              decoration: InputDecoration(
                                hintText: 'Date',
                                hintStyle: TextStyle(color: Colors.black54),
                                errorStyle: TextStyle(
                                  fontSize: 0,
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              readOnly: true, 
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                    context: context, initialDate: DateTime.now(),
                                    firstDate: DateTime(1900), 
                                    lastDate: DateTime.now()
                                );
                                if(pickedDate != null ){
                                  String formattedDate = DateFormat('yyyy-MM-dd').format(pickedDate); 
                                  birthDateController.text = formattedDate;
                                } 
                              },
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.home,
                              color: Colors.white,
                            ),
                            title: TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Error';
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
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              controller: locationController,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.phone,
                              color: Colors.white,
                            ),
                            title: TextFormField(
                              inputFormatters: [ FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(10)],
                              validator: (value) {
                                if (value == null || value.isEmpty || value.length != 10) {
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
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              controller: numberController,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          ListTile(
                            leading: Icon(
                              Icons.wallet_travel,
                              color: Colors.white,
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
                                  borderSide: BorderSide(color: Colors.white),
                                ),
                              ),
                              controller: jobController,
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    
                  ),
                ),
                Expanded(
                  child: SizedBox(
                    height: 480,
                    child: Column(
                      children: [
                        Text("Information de l\'organisme",style: TextStyle(
                            color: Colors.white)),
                        ListTile(
                          leading: Icon(
                            Icons.local_activity,
                            color: Colors.white,
                          ),
                          title: TextFormField(
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Error';
                                }
                                return null;
                              },
                            decoration: InputDecoration(
                              hintText: 'Nom de l\'entreprise',
                              hintStyle: TextStyle(color: Colors.black54),
                              errorStyle: TextStyle(
                                  fontSize: 0,
                                ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            controller: companyNameController,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.numbers,
                            color: Colors.white,
                          ),
                          title: TextFormField(
                            inputFormatters: [ FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(30)],
                            validator: (value) {
                                if (value == null || value.isEmpty || value.length < 2) {
                                  return 'Error';
                                }
                                return null;
                              },
                            decoration: InputDecoration(
                              hintText: 'Numéro de Siret',
                              hintStyle: TextStyle(color: Colors.black54),
                              errorStyle: TextStyle(
                                  fontSize: 0,
                                ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            controller: companySiretController,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.reduce_capacity,
                            color: Colors.white,
                          ),
                          title: TextFormField(
                            inputFormatters: [ FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(15)],
                            validator: (value) {
                                if (value == null || value.isEmpty || value == '0') {
                                  return 'Error';
                                }
                                return null;
                              },
                            decoration: InputDecoration(
                              hintText: 'Capacité',
                              hintStyle: TextStyle(color: Colors.black54),
                              errorStyle: TextStyle(
                                  fontSize: 0,
                                ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            controller: companyCapacityController,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          title: TextFormField(
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Error';
                                }
                                return null;
                              },
                            decoration: InputDecoration(
                              hintText: 'adresse',
                              hintStyle: TextStyle(color: Colors.black54),
                              errorStyle: TextStyle(
                                  fontSize: 0,
                                ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            controller: companyaddressController,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          title: TextFormField(
                            validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Error';
                                }
                                return null;
                              },
                            decoration: InputDecoration(
                              hintText: 'Ville',
                              hintStyle: TextStyle(color: Colors.black54),
                              errorStyle: TextStyle(
                                  fontSize: 0,
                                ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            controller: companyCityController,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        ListTile(
                          leading: Icon(
                            Icons.location_on,
                            color: Colors.white,
                          ),
                          title: TextFormField(
                            inputFormatters: [ FilteringTextInputFormatter.digitsOnly, LengthLimitingTextInputFormatter(5)],
                            validator: (value) {
                                if (value == null || value.isEmpty || value.length != 5) {
                                  return 'Error';
                                } else {
                                  return null;
                                }
                              },
                            decoration: InputDecoration(
                              hintText: 'Code postal',
                              hintStyle: TextStyle(color: Colors.black54),
                              errorStyle: TextStyle(
                                  fontSize: 0,
                                ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.white),
                              ),
                            ),
                            controller: companyZipController,
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.centerRight,
              child: TextButton(
                  onPressed: () => _goToRegister(context),
                  child: Text(
                      "Vous avez déjà un compte",
                      style: TextStyle(color: Colors.brown)
                  )
              ),
            ),
            Center(
              child: OutlinedButton(
                  style: OutlinedButton.styleFrom(primary: Colors.red),
                  onPressed: () => {
                    if (_formKey.currentState!.validate()) {
                      _register(context, lastnameController.text, firstnameController.text, mailController.text, passwordController.text, birthDateController.text,
                      locationController.text, numberController.text, jobController.text, companyNameController.text, companySiretController.text, 
                      companyCapacityController.text, companyaddressController.text, companyCityController.text, companyZipController.text
                      )
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Veuillez remplir tous les champs')),
                      ),
                    } 
                  },
                  child: Text(
                      "Valider",
                      style: TextStyle(color: Colors.white)
                  ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _goToRegister(BuildContext context) {
    Navigator.pushNamed(context, RoutesName.connexion);
  }

  void _register(context, lastname, firstname, mail, password, birthDate, location, number, job, name, siret, capacity, address, city, zip) {
    FirebaseAuthService.signUp(context, mail, password).then((firebase) => {
      if (firebase != '') {
          CompanyServices.createCompany(name, siret, capacity, address, city, zip)
          .then((company) => UserServices.createAdmin(firstname, lastname, birthDate, location, mail, number, job, firebase, company.id)
            .then((admin) => { 
              FirebaseAuthService.storeUserAndToken(admin),
              Navigator.pushNamedAndRemoveUntil(context, RoutesName.home, (route) => false)
              }
            )
          )
      }
    });
  }
}