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

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool _isInitial = true;
  bool _isLoading = true;
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
        print(e);
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
      body: Column(
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
                        print(e['value']);
                        Navigator.of(context).pushNamed(
                            CategoryScreen.routeName,
                            arguments: e['value']);
                      },
                    ),
                  )
                  .toList(),
            ),
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
                        child: _isLoading
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
      drawer: AppDrawer(),
    );
  }
}
