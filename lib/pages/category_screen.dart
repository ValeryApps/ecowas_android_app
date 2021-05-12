import 'package:ecowas24/models/Story.dart';
import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/widgets/StoryCard.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = "category_screen";
  @override
  Widget build(BuildContext context) {
    final cat = ModalRoute.of(context).settings.arguments;
    final List<Blog> stories =
        Provider.of<StoryProvider>(context).getStoriesByCategory(cat);
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
