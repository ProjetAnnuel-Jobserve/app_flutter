import 'package:flutter/material.dart';
import 'package:jobserve_ref/models/user.dart';
import 'package:jobserve_ref/services/user_service.dart';
import 'package:jobserve_ref/utils/shared_preferences.dart';
import 'package:jobserve_ref/widget/user/user_items.dart';

import '../../screens/users/add_user.dart';

class UserList extends StatelessWidget {
  const UserList({
    Key? key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future:
            UserServices.getUsers(UserSharedPreferences.getValue('idCompany')),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Center(
                  child: Text("Error: ${snapshot.error}"),
                );
              }
              if (snapshot.hasData) {
                final List<UserApp> users = snapshot.data;
                if (users.isEmpty) {
                  return Center(
                    child: Column(
                      children: [
                        TextButton.icon(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => add_user(
                                  idCompany: UserSharedPreferences.getValue('idCompany')!,
                                ),
                              ),
                            );
                          },
                          icon: Icon(
                            Icons.add_circle,
                            size: 24.0,
                            semanticLabel: 'plus',
                          ),
                          label: Text("Ajouter un utilisateur"),
                        ),
                        Text("Empty list"),
                      ],
                    ),
                  );
                }
                return UserTable(users: users);
              } else {
                return Center(
                  child: Text("No data"),
                );
              }
            default:
              return Container();
          }
        },
      ),
    );
  }
}