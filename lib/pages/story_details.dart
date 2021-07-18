import 'package:ecowas24/models/Story.dart';
import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:cached_network_image/cached_network_image.dart';

class StoryDetails extends StatelessWidget {
  static const String routeName = "story_details";
  const StoryDetails({Key key}) : super(key: key);

  openInBrowser(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'could not lunch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    final slug = ModalRoute.of(context).settings.arguments as String;
    final Blog story = Provider.of<StoryProvider>(context).getStoryBySlug(slug);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              "assets/ecowas24.png",
              width: 40,
            ),
            SizedBox(
              width: 5,
            ),
            Text('Ecowas24 news',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.green,
                    fontWeight: FontWeight.bold)),
          ],
        ),
        actions: [
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            itemBuilder: (item) => [
              PopupMenuItem(
                child: Text("Login"),
                value: "Login",
              )
            ],
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration(color: Colors.white24),
        padding: EdgeInsets.symmetric(
          vertical: 8.0,
          horizontal: 8.0,
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image(
                image: CachedNetworkImageProvider(
                  story.imageUrl,
                  // fit: BoxFit.cover,
                ),
              ),
              Text(
                story.title,
                style: GoogleFonts.textMeOne(fontSize: 32, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Row(children: [Icon(Icons.language), Text(story.language)]),
                    // SizedBox(
                    //   width: 10,
                    // ),
                    Row(children: [
                      Icon(FontAwesomeIcons.clock),
                      SizedBox(
                        width: 10,
                      ),
                      Text("${timeago.format(story.datePublished)}")
                    ]),

                    Row(children: [
                      Icon(FontAwesomeIcons.newspaper),
                      SizedBox(
                        width: 10,
                      ),
                      Text(story.author)
                    ]),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Text(
                story.intro,
                style: GoogleFonts.textMeOne(fontSize: 28,fontWeight: FontWeight.bold)
                // TextStyle(fontSize: 20, fontWeight:
                // FontWeight.bold, fontFamily: GoogleFonts.lato,
                // ),
              ),
              SizedBox(
                height: 20,
              ),
              Html(
                data: story.body,
                defaultTextStyle: GoogleFonts.textMeOne(fontSize: 23)
              ),
              SizedBox(
                height: 20,
              ),
              TextButton.icon(
                onPressed: () => openInBrowser(story.externUrl),
                label: Text(
                  "Read more",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                icon: Icon(Icons.open_in_browser),
              ),
            ],
          ),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
