import 'package:ecowas24/models/Story.dart';
import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/widgets/StoryCard.dart';
import 'package:ecowas24/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoriesPerCountry extends StatelessWidget {
  static const String routeName = "stories_per_country";
  // bool hasStories;
  @override
  Widget build(BuildContext context) {
    final country = ModalRoute.of(context).settings.arguments;
    final List<Blog> stories =
        Provider.of<StoryProvider>(context).getStoriesByCountry(country);

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
      body: Column(
        children: [
          Text(
            "$country news",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 23,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: stories.length == 0
                ? Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "No new news for $country yet",
                        style: TextStyle(fontSize: 33),
                        softWrap: true,
                        textAlign: TextAlign.center,
                      ),
                    ),
                  )
                : ListView.builder(
                    itemCount: stories.length,
                    itemBuilder: (BuildContext context, int index) {
                      var story = stories[index];
                      return ChangeNotifierProvider<Blog>.value(
                        value: story,
                        child: StoryCard(),
                      );
                    },
                  ),
          ),
        ],
      ),
      drawer: AppDrawer(),
    );
  }
}
