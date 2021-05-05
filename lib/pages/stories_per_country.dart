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
        title: Row(
          children: [
            Image.asset(
              "assets/ecowas24.png",
              width: 60,
            ),
            SizedBox(
              width: 10,
            ),
            Text('$country news'),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: stories.length,
        itemBuilder: (BuildContext context, int index) {
          var story = stories[index];
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
