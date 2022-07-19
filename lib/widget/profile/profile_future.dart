import 'package:flutter/material.dart';
import 'package:jobserve_ref/services/user_service.dart';
import 'package:jobserve_ref/utils/shared_preferences.dart';
import 'package:jobserve_ref/widget/profile/profile_item.dart';

import '../../models/user.dart';


class ProfileFuture extends StatelessWidget {
  const ProfileFuture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: FutureBuilder(
              future:   UserServices.getUserbyId(UserSharedPreferences.getValue("id")!),
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                switch (snapshot.connectionState) {
                  case ConnectionState.waiting:
                    return Center(
                      child: Padding(
                        padding: const EdgeInsets.all(38.0),
                        child: CircularProgressIndicator(),
                      ),
                    );
                  case ConnectionState.done:
                    if (snapshot.hasError) {
                      return Center(
                        child: Text("Error: ${snapshot.error} ici"),
                      );
                    }
                    if (snapshot.hasData) {
                      final UserApp profil = snapshot.data;
                      return ProfileItem(profil:profil);
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
          ),
        ],
      ),
    );
  }
}