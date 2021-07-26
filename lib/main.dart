import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/models/videos_provider.dart';
import 'package:ecowas24/pages/category_screen.dart';
import 'package:ecowas24/pages/home_page.dart';
import 'package:ecowas24/pages/on_the_web_news.dart';
import 'package:ecowas24/pages/story_details.dart';
import 'package:ecowas24/pages/user.dart';
import 'package:ecowas24/pages/video_details.dart';
import 'package:ecowas24/pages/webview_screen.dart';
import 'package:ecowas24/widgets/tab_Screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecowas24/pages/stories_per_country.dart';

import 'constants/theme_data.dart';
import 'provider/dark_theme_provider.dart';

void main() {
  runApp(MyApp());
}

// ignore: must_be_immutable
class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  DarkThemProvider themeChanger = DarkThemProvider();

  void getCurrentAppTheme() async {
    themeChanger.darkTheme = await themeChanger.themePreferences.getTheme();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => StoryProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => VideosProvider(),
        ),
        ChangeNotifierProvider<DarkThemProvider>(create: (_) => themeChanger)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: DarkThemeData.themeData(themeChanger.darkTheme, context),
        home: TabScreen(),
        routes: {
          StoryDetails.routeName: (cxt) => StoryDetails(),
          StoriesPerCountry.routeName: (cxt) => StoriesPerCountry(),
          CategoryScreen.routeName: (cxt) => CategoryScreen(),
          HomePage.routeName: (cxt) => HomePage(),
          WebViewScreen.routeName: (cxt) => WebViewScreen(),
          OnTheWebScreen.routeName: (cxt) => OnTheWebScreen(),
          UserInfoScreen.routeName: (cxt) => UserInfoScreen(),
          VideoDetails.routeName: (ctx) => VideoDetails(),
        },
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
