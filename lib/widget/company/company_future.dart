import 'package:flutter/material.dart';
import 'package:jobserve_ref/models/company.dart';
import 'package:jobserve_ref/services/company_service.dart';
import 'package:jobserve_ref/utils/shared_preferences.dart';
import 'package:jobserve_ref/widget/company/company_item.dart';


class CompanyFuture extends StatelessWidget {
  const CompanyFuture({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            child: FutureBuilder(
              future: CompanyServices.getCompanybyId('${UserSharedPreferences.getValue("idCompany")}'),
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
                      final Company company = snapshot.data;
                      return CompanyItem(company: company);
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
