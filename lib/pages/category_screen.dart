import 'package:ecowas24/models/Story.dart';
import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/widgets/StoryCard.dart';
import 'package:ecowas24/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = "category_screen";
  @override
  Widget build(BuildContext context) {
    final cat = ModalRoute.of(context).settings.arguments;
    final List<Blog> stories =
        Provider.of<StoryProvider>(context).getStoriesByCategory(cat);
    print(stories);
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
        itemCount: stories.length,
        itemBuilder: (BuildContext context, int index) {
          var story = stories[index];
          return ChangeNotifierProvider<Blog>.value(
            value: story,
            child: StoryCard(),
          );
        },
      ),
    );
  }
}
