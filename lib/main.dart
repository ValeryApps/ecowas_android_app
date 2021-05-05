import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/pages/category_screen.dart';
import 'package:ecowas24/pages/story_details.dart';
import 'package:ecowas24/widgets/tab_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecowas24/pages/stories_per_country.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StoryProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            primarySwatch: Colors.green,
            primaryColor: Colors.green,
            accentColor: Colors.amber),
        home: TabScreen(),
        routes: {
          StoryDetails.routeName: (cxt) => StoryDetails(),
          StoriesPerCountry.routeName: (cxt) => StoriesPerCountry(),
          CategoryScreen.routeName: (cxt) => CategoryScreen(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
