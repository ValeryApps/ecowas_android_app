import 'package:ecowas24/constants/countries.dart';
import 'package:ecowas24/widgets/country_Listtile.dart';
import 'package:flutter/material.dart';
import 'package:ecowas24/pages/stories_per_country.dart';

class AppDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 3 / 5,
      color: Colors.white,
      child: Column(
        children: [
          AppBar(
            title: Row(
              children: [
                Image.asset(
                  "assets/ecowas24.png",
                  width: 60,
                ),
                SizedBox(
                  width: 10,
                ),
                Text('Ecowas24 news'),
              ],
            ),
            automaticallyImplyLeading: false,
            actions: [Icon(Icons.comment)],
          ),
          Divider(),
          Container(
            height: MediaQuery.of(context).size.height * 7 / 10,
            child: ListView.builder(
              itemCount: countries.length,
              itemBuilder: (BuildContext context, int index) {
                return CountryListTile(
                  countryCode: countries[index]['code'],
                  country: countries[index]['name'],
                  navigateTo: () {
                    Navigator.of(context).pushNamed(StoriesPerCountry.routeName,
                        arguments: countries[index]['name']);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
