import 'package:flutter/material.dart';
import 'package:jobserve_ref/constant.dart';
import 'package:jobserve_ref/models/user.dart';
import 'package:jobserve_ref/screens/users/add_user.dart';

import 'package:jobserve_ref/screens/users/user_detail.dart';
import 'package:jobserve_ref/utils/shared_preferences.dart';


class UserTable extends StatefulWidget {
  const UserTable({Key? key, required this.users}) : super(key: key);
  final List<UserApp> users;

  @override
  State<UserTable> createState() => _UserTableState();
}

class _UserTableState extends State<UserTable> {
  bool showTypeUser = false;
  String typeUser = "";

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        children: [
          if(UserSharedPreferences.getValue('permission') == "admin") ... [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                alignment: Alignment.centerRight,
                child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => add_user(
                            idCompany: widget.users[0].idCompany,
                          ),
                        ),
                      );
                    },
                    icon: Icon(
                      Icons.add_circle,
                      size: 24.0,
                      semanticLabel: 'plus',
                    ),
                    label: Text("Ajouter un utilisateur")),
              ),
            ),
          ],
          Expanded(
            child: ListView(
              children: [
                DataTable(
                  columns: const <DataColumn>[
                    DataColumn(
                      label: Text('Name'),
                    ),
                    DataColumn(
                      label: Text('Mail'),
                    ),
                    DataColumn(
                      label: Text('Telephone'),
                    ),
                    DataColumn(
                      label: Text('Permission'),
                    ),
                    DataColumn(
                      label: Text('Infos'),
                    )
                  ],
                  rows: List<DataRow>.generate(
                    widget.users.length,
                    (int index) => DataRow(
                      cells: <DataCell>[
                        DataCell(Text(
                            '${widget.users[index].firstname + ' ' + widget.users[index].lastname}  ')),
                        DataCell(Text('${widget.users[index].email}')),
                        DataCell(Text('${widget.users[index].phoneNumber}')),
                        DataCell(
                          Text('${widget.users[index].permission}'),
                        ),
                        DataCell(
                          ElevatedButton(
                            child: Icon(Icons.info_outline),
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Card_User(
                                    user: widget.users[index],
                                  ),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                                primary: jSecondaryColor),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class userType extends StatefulWidget {
  final String permission;

  const userType({required this.permission}) : super();

  @override
  State<userType> createState() => _userTypeState();
}

class _userTypeState extends State<userType> {
  @override
  Widget build(BuildContext context) {
    String dropdownValue = widget.permission;
    return DropdownButton<String>(
      value: dropdownValue,
      onChanged: (String? newValue) {
        setState(() {
          dropdownValue = newValue!;
        });
      },
      items: <String>["user", "modo", "admin"]
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
