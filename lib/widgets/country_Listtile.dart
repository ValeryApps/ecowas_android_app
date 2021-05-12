import 'package:flutter/material.dart';

class CountryListTile extends StatelessWidget {
  final String countryCode;
  final String country;
  final Function navigateTo;
  const CountryListTile({
    Key key,
    @required this.countryCode,
    @required this.country,
    @required this.navigateTo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigateTo,
      child: Column(
        children: [
          ListTile(
            leading: CircleAvatar(
              backgroundImage: AssetImage('icons/flags/png/$countryCode.png',
                  package: 'country_icons'),
            ),
            title: Text(
              country,
              style: TextStyle(fontSize: 24, color: Colors.green),
            ),
          ),
          Divider(
            color: Colors.green,
          )
        ],
      ),
    );
  }
}
