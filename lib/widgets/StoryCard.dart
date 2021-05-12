import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecowas24/models/Story.dart';
import 'package:ecowas24/pages/story_details.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'package:timeago/timeago.dart' as timeago;

const url = "http://www.ecowas24.com/assets/e24.png";

class StoryCard extends StatelessWidget {
  // final String title;
  // final String imageUrl;
  // final String slug;
  // final String country;
  // final String language;
  // final int views;

  // const StoryCard({
  //   Key key,
  //   this.title,
  //   this.imageUrl,
  //   this.slug,
  //   this.country,
  //   this.language,
  //   this.views,
  // }) : super(key: key);

  selectStory(BuildContext context, String slug) {
    Navigator.of(context).pushNamed(StoryDetails.routeName, arguments: slug);
  }

  @override
  Widget build(BuildContext context) {
    var story = Provider.of<Blog>(context);
    return InkWell(
      onTap: () => selectStory(context, story.slug),
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
                  alignment: Alignment.bottomRight,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(12),
                          topRight: Radius.circular(12)),
                      child: Image(
                        image: CachedNetworkImageProvider(
                          story.imageUrl,
                          //maxWidth: double.infinity,
                          //height: 250,
                          //fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                        width: MediaQuery.of(context).size.width * 4 / 5,
                        padding: EdgeInsets.symmetric(
                            vertical: 28.0, horizontal: 12),
                        decoration: BoxDecoration(color: Colors.black54),
                        child: Text(
                          story.title,
                          style: TextStyle(color: Colors.white, fontSize: 18),
                          overflow: TextOverflow.ellipsis,
                          softWrap: true,
                        ))
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
                        Text("${timeago.format(story.datePublished)}")
                      ]),
                      Row(
                        children: [
                          Icon(Icons.flag),
                          SizedBox(
                            width: 5,
                          ),
                          Text(story.country),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.countertops),
                          SizedBox(
                            width: 5,
                          ),
                          Text(story.views.toString()),
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
