import 'package:flutter/material.dart';

class CountryCard extends StatelessWidget {
  final String countryCode;
  final String countryName;
  final Function navigateTo;
  const CountryCard({
    Key key,
    this.countryCode,
    @required this.countryName,
    this.navigateTo,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: navigateTo,
      child:Card(
        elevation: 8,
        child: Column(
          children: [
            Image.asset('icons/flags/png/$countryCode.png',fit: BoxFit.cover,
                package: 'country_icons'),
            Text(countryName, style:TextStyle(fontSize: 20),)
          ],
        ),
      ),
    );
  }
}
