import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowas24/models/website.dart';
import 'package:ecowas24/pages/webview_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

InkWell buildInkWell(Website web, BuildContext context) {
  return InkWell(
    child: Card(
      elevation: 8,
      child: Container(
        padding: EdgeInsets.all(8),
        child: Stack(
          children: [
            web.imageUrl.endsWith(".svg")
                ? SvgPicture.network(
              web.imageUrl,
            )
                : CachedNetworkImage(imageUrl:
              web.imageUrl,
              // fit: BoxFit.cover,
            ),
            Positioned(
              child: Text(
                web.name,
                style: TextStyle(),
              ),
              bottom: 0,
            ),
          ],
        ),
      ),
    ),
    onTap: () => Navigator.of(context).pushNamed(
        WebViewScreen.routeName,
        arguments: web.id),
  );
}