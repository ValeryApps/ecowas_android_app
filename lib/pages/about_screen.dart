import 'package:ecowas24/models/video.dart';
import 'package:ecowas24/models/videos_provider.dart';
import 'package:ecowas24/widgets/app_drawer.dart';
import 'package:ecowas24/widgets/video_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

// ignore: must_be_immutable
class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> {
  bool _isInitial = true;
  @override
  void didChangeDependencies() async {
    if (_isInitial &&
        Provider.of<VideosProvider>(context).videoItems.length == 0) {
      try {
        await Provider.of<VideosProvider>(context).fetchVideos();
      } catch (err) {
        print(err);
      } finally {
        setState(() {
          _isInitial = false;
        });
      }
    } else {
      setState(() {
        _isInitial = false;
      });
    }
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    var videos = Provider.of<VideosProvider>(context).videoItems;
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
      body: ListView.builder(
        itemCount: videos.length,
        itemBuilder: (context, index) {
          var video = videos[index];
          return ChangeNotifierProvider<Video>.value(
            value: video,
            child: VideoCard(),
          );
          //
        },
      ),
      drawer: AppDrawer(),
    );
  }
}
