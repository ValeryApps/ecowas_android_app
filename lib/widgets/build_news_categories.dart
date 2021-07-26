import 'package:ecowas24/constants/countries.dart';
import 'package:ecowas24/pages/category_screen.dart';
import 'package:flutter/cupertino.dart';

import 'category_widget.dart';

Container buildNewsCategories(BuildContext context, List<Map<String, dynamic>> categories) {
  return Container(
    height: 120,
    child: ListView(
      scrollDirection: Axis.horizontal,
      children: newsCategories
          .map(
            (e) => CategoryWidget(
          text: e['value'],
          imageUrl: e['imageUrl'],
          onTap: () {
            Navigator.of(context).pushNamed(
                CategoryScreen.routeName,
                arguments: e['cat']);
          },
        ),
      )
          .toList(),
    ),
  );
}