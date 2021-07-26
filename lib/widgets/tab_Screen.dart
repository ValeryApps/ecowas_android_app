
import 'package:ecowas24/pages/about_screen.dart';
import 'package:ecowas24/pages/countriesScreen.dart';
import 'package:ecowas24/pages/home_page.dart';
import 'package:ecowas24/pages/popular_stories_screen.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TabScreen extends StatefulWidget {
  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  final List<Widget> _pages = [
    HomePage(),
    PopularStoriesScreen(),
    CountriesScreen(),
    AboutScreen(),
  ];
  int _currentIndex = 0;

  void _onTap(index) {
    setState(() {
      _currentIndex = index;
    });
  }

  BottomNavigationBarItem _bottomTab({
    @required IconData icon,
    @required Color color,
    @required String text,
    @required double size,
  }) {
    return BottomNavigationBarItem(
      icon: Icon(icon, size: size),
      label: text,
      backgroundColor: color,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(

        elevation: 10,
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.black54,
        currentIndex: _currentIndex,
        items: [
          _bottomTab(
            icon: Icons.home,
            text: "Home",
            color: Colors.teal,
            size: 30,
          ),
          _bottomTab(
              icon: FontAwesomeIcons.heart,
              text: "Popular",
              color: Colors.teal,
              size: 30),
          _bottomTab(
              icon: FontAwesomeIcons.newspaper,
              text: "Auth",
              color: Colors.teal,
              size: 30),
          _bottomTab(
              icon: FontAwesomeIcons.video,
              text: "Ecowas24 TV",
              color: Colors.teal,
              size: 30),
        ],
        onTap: _onTap,
      ),
    );
  }
}
