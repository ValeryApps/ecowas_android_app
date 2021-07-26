import 'package:ecowas24/constants/countries.dart';
import 'package:ecowas24/models/Story.dart';
import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/widgets/StoryCard.dart';
import 'package:ecowas24/widgets/build_news_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryScreen extends StatelessWidget {
  static const routeName = "category_screen";
  @override
  Widget build(BuildContext context) {
    final cat = ModalRoute.of(context).settings.arguments as String;
    final List<Blog> stories =
        Provider.of<StoryProvider>(context).getStoriesByCategory(cat);
    final category = newsCategories.firstWhere((element) => element['cat']==cat);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.green),
        elevation: 0,
        title: Row(
          children: [
            Image.asset(
              "assets/ecowas.png",
              width: 40,
            ),
            SizedBox(
              width: 5,
            ),
            Text(category['value'],
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),),
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
          buildNewsCategories(context, newsCategories),
          SizedBox(height: 10,),
          Text("News - ${category['value']}",style: TextStyle(
              fontSize: 25,
              color: Colors.teal,
              fontWeight: FontWeight.bold)),
          SizedBox(height: 10,),
          Expanded(
            child: ListView.builder(
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
    );
  }
}
