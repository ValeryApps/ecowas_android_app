import 'package:ecowas24/constants/countries.dart';
import 'package:ecowas24/models/Story.dart';
import 'package:ecowas24/models/stories_provider.dart';
import 'package:ecowas24/pages/category_screen.dart';
import 'package:ecowas24/widgets/StoryCard.dart';
import 'package:ecowas24/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ecowas24/widgets/category_widget.dart';

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
      body: Container(
        margin: EdgeInsets.symmetric(
          vertical: 8.0,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              height: 70,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: categories
                    .map(
                      (e) => CategoryWidget(
                        text: e['cat'],
                        color: e['color'],
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              CategoryScreen.routeName,
                              arguments: e['value']);
                        },
                      ),
                    )
                    .toList(),
              ),
            ),
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
