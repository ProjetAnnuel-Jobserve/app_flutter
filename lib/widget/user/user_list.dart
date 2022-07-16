import 'package:flutter/material.dart';
import 'package:jobserve_ref/services/users_services.dart';
import 'package:jobserve_ref/models/user_model.dart';
import 'package:jobserve_ref/widget/user/user_item.dart';
import 'package:jobserve_ref/widget/user/user_items.dart';

class UserList extends StatelessWidget {
  const UserList({
    Key? key,
    //required this.idSeason,
  }) : super(key: key);

  //final int idSeason;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: UserServices.getUsers(),
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
                final List<User> users = snapshot.data;
                if (users.isEmpty) {
                  return Center(
                    child: Text("Empty list"),
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
