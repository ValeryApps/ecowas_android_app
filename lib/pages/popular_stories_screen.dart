import 'package:ecowas24/models/Story.dart';
import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/widgets/StoryCard.dart';
import 'package:ecowas24/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dartx/dartx.dart';

class PopularStoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Blog> stories =
        Provider.of<StoryProvider>(context).getFavoriteStories();
    var sortedStories = stories.sortedByDescending((e) => e.views);

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
      body: ListView.builder(
        itemCount: sortedStories.length,
        itemBuilder: (BuildContext context, int index) {
          var story = sortedStories[index];
          return ChangeNotifierProvider<Blog>.value(
            value: story,
            child: StoryCard(),
          );
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
