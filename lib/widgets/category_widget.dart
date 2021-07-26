import 'package:flutter/material.dart';

class CategoryWidget extends StatelessWidget {
  final String text;
  final String imageUrl;
  final Function onTap;

  const CategoryWidget({Key key, this.text, this.imageUrl, this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: NetworkImage(imageUrl), fit: BoxFit.cover)),
              margin: EdgeInsets.symmetric(
                vertical: 8.0,
                horizontal: 3.0,
              ),
              width: 150,
              height: 100,
            ),
            Positioned(
              top: 10,
              left: 3,
              right: 3,
              bottom: 0,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(.6),
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Positioned(
                bottom: 0,
                left: 4,
                right: 4,
                child: Container(
                  height: 30,
                  width: 150,
                  padding: EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    color: Colors.teal.withOpacity(.8),
                    borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10)),
                  ),
                  child: Text(
                    text,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  ),
                ))
          ],
        ));
  }
}
