import 'package:ecowas24/constants/countries.dart';
import 'package:ecowas24/models/Story.dart';
import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/models/website.dart';
import 'package:ecowas24/widgets/StoryCard.dart';
import 'package:ecowas24/widgets/app_drawer.dart';
import 'package:ecowas24/widgets/build_inkwell.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class StoriesPerCountry extends StatelessWidget {
  static const String routeName = "stories_per_country";
  // bool hasStories;
  @override
  Widget build(BuildContext context) {
    final country = ModalRoute.of(context).settings.arguments as String;
    print(country);
    final List<Blog> stories =
        Provider.of<StoryProvider>(context).getStoriesByCountry(country);
    final countryStories = stories.take(10).toList();
    final List<Website> websites =
        webs.where((element) => element.countryName == country).toList();
    final _theCountry =
        countries.firstWhere((element) => element['name'] == country);
    print(_theCountry);
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
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 5),
                child: CircleAvatar(
                  backgroundImage: AssetImage(
                      'icons/flags/png/${_theCountry['code']}.png',
                      package: 'country_icons'),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "$country",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24,
                ),
              ),
            ],
          ),
          Divider(thickness: 1, color: Colors.green),
          Text(
            'Main Online Medias',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          Container(
            height: 100,
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: websites.length,
                itemBuilder: (context, int) {
                  return buildInkWell(websites[int], context);
                }),
          ),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: countryStories.length == 0
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
                    itemCount: countryStories.length,
                    itemBuilder: (BuildContext context, int index) {
                      var story = countryStories[index];
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
