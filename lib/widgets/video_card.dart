import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowas24/models/video.dart';
import 'package:ecowas24/pages/video_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

const url = "http://www.ecowas24.com/assets/e24.png";

class VideoCard extends StatelessWidget {


  selectVideo(BuildContext context, int id) {
    Navigator.of(context).pushNamed(VideoDetails.routeName, arguments: id);
  }

  @override
  Widget build(BuildContext context) {
    var video = Provider.of<Video>(context);
    return InkWell(
      onTap: () => selectVideo(context, video.id),
      child: Container(
        margin: EdgeInsets.symmetric(
          horizontal: 8.0,
        ),
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(12)),
        child: Card(
            margin: EdgeInsets.only(bottom: 10),
            child: Column(
              children: [
                Stack(
                  // alignment: Alignment.bottomRight,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: Image(
                        image: CachedNetworkImageProvider(
                          video.thumbnailUrl,
                          //maxWidth: double.infinity,
                          //height: 250,
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: Container(
                          width: MediaQuery.of(context).size.width * 4 / 5,
                          padding: EdgeInsets.symmetric(
                              vertical: 28.0, horizontal: 12),
                          decoration: BoxDecoration(color: Colors.black54),
                          child: Text(
                            video.title,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                            overflow: TextOverflow.ellipsis,
                            softWrap: true,
                          )),
                    )
                  ],
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 18.0,
                    horizontal: 8.0,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(children: [
                        Icon(FontAwesomeIcons.clock),
                        SizedBox(
                          width: 5,
                        ),
                        Text("${timeago.format(video.datePublished)}")
                      ]),
                      Row(
                        children: [
                          Icon(Icons.flag),
                          SizedBox(
                            width: 5,
                          ),
                          Text(video.country ?? ""),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.countertops),
                          SizedBox(
                            width: 5,
                          ),
                          Text(video.views.toString()),
                        ],
                      ),
                    ],
                  ),
                )
              ],
            )),
      ),
    );
  }
}
