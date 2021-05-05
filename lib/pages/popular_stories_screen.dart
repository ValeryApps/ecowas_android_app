import 'package:ecowas24/models/Story.dart';
import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/widgets/StoryCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dartx/dartx.dart';

class PopularStoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final List<Blog> stories =
        Provider.of<StoryProvider>(context).getFavoriteStories();
    var sortedStories = stories.sortedByDescending((e) => e.views);
    // .thenByDescending((element) => element.views);
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.asset(
              "assets/ecowas24.png",
              width: 60,
            ),
            SizedBox(
              width: 10,
            ),
            Text('Ecowas24 news'),
          ],
        ),
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
    );
  }
}
