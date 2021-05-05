import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String text;
  final Color color;
  final Function onTap;

  const CategoryWidget({Key key, this.text, this.color, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        alignment: Alignment.center,
        child: Text(
          text,
          style: TextStyle(fontSize: 18, color: Colors.white),
        ),
        color: color,
        margin: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 3.0,
        ),
        width: 120,
      ),
    );
  }
}
