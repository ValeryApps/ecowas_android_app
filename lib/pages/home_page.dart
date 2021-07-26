import 'package:ecowas24/constants/countries.dart';
import 'package:ecowas24/models/Story.dart';
import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/pages/user.dart';
import 'package:ecowas24/widgets/StoryCard.dart';
import 'package:ecowas24/widgets/app_drawer.dart';
import 'package:ecowas24/widgets/build_news_categories.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  static const String routeName = "home";

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isInitial = true;
  bool _isLoading = true;
  bool _isError = false;
  @override
  void didChangeDependencies() async {
    if (_isInitial &&
        Provider.of<StoryProvider>(
              context,
              listen: false,
            ).storyItems.length ==
            0) {
      try {
        await Provider.of<StoryProvider>(context).fetchStories();
      } catch (e) {
        setState(() {
          _isError = true;
          _isLoading = false;
        });
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(e.message),
          backgroundColor: Theme.of(context).errorColor,
        ));
      } finally {
        _isLoading = false;
        _isInitial = false;
      }
    } else {
      _isLoading = false;
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final stories =
        Provider.of<StoryProvider>(context, listen: false).storyItems;
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
          IconButton(
            onPressed: () =>
                Navigator.of(context).pushNamed(UserInfoScreen.routeName),
            icon: Icon(Icons.settings),
          ),
        ],
      ),
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            buildNewsCategories(context, newsCategories),
            SizedBox(
              height: 12,
            ),
            _isLoading
                ? Center(child: CircularProgressIndicator())
                : Expanded(
                    child: ListView.builder(
                      itemCount: stories.length,
                      itemBuilder: (BuildContext context, int index) {
                        var story = stories[index];
                        return ChangeNotifierProvider<Blog>.value(
                          value: story,
                          child: _isError
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : StoryCard(),
                        );
                      },
                    ),
                  ),
          ],
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
