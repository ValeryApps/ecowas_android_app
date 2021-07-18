import 'package:ecowas24/constants/countries.dart';
import 'package:ecowas24/widgets/country_Listtile.dart';
import 'package:flutter/material.dart';
import 'package:ecowas24/pages/stories_per_country.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 4 / 5,
      color: Colors.white,
      child: Column(
        children: [
          Card(
            elevation: 8,
            child: Container(
              padding: EdgeInsets.only(top: 40, left: 50, bottom: 20),
              child: Row(
                children: [
                  Image.asset(
                    "assets/ecowas24.png",
                    width: 100,
                  ),
                ],
              ),
            ),
          ),
          Divider(),
          Container(
            height: MediaQuery.of(context).size.height * 7 / 10,
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.home),
                  title: Text("Home"),
                  onTap: () => Navigator.of(context).pop(),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: countries.length,
                    itemBuilder: (BuildContext context, int index) {
                      return CountryListTile(
                        countryCode: countries[index]['code'],
                        country: countries[index]['name'],
                        navigateTo: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).pushNamed(
                              StoriesPerCountry.routeName,
                              arguments: countries[index]['name']);
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
