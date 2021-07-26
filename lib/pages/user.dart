import 'package:ecowas24/provider/dark_theme_provider.dart';
import 'package:flutter/material.dart';

// ignore: import_of_legacy_library_into_null_safe
import 'package:flutter_icons/flutter_icons.dart';
import 'package:list_tile_switch/list_tile_switch.dart';
import 'package:provider/provider.dart';

class UserInfoScreen extends StatefulWidget {
  static const routeName = "user_router";

  const UserInfoScreen({Key key}) : super(key: key);

  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  ScrollController _scrollController = ScrollController();
  var top = 0.0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          CustomScrollView(
            controller: _scrollController,
            slivers: <Widget>[
              SliverAppBar(
                automaticallyImplyLeading: false,
                elevation: 4,
                expandedHeight: 200,
                pinned: true,
                flexibleSpace: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  top = constraints.biggest.height;
                  return Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.white,
                            Colors.white,
                          ],
                          begin: const FractionalOffset(0.0, 0.0),
                          end: const FractionalOffset(1.0, 0.0),
                          stops: [0.0, 1.0],
                          tileMode: TileMode.clamp),
                    ),
                    child: FlexibleSpaceBar(
                      collapseMode: CollapseMode.parallax,
                      centerTitle: true,
                      title: Row(
                        //  mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          AnimatedOpacity(
                            duration: Duration(milliseconds: 300),
                            opacity: top <= 110.0 ? 1.0 : 0,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 12,
                                ),
                                Container(
                                  height: kToolbarHeight / 1.8,
                                  width: kToolbarHeight / 1.8,
                                  decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.white,
                                        blurRadius: 1.0,
                                      ),
                                    ],
                                    shape: BoxShape.circle,
                                    image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(
                                          'http://africavictorytech.com/assets/img/Logo.png'),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 12,
                                ),
                                Text(
                                  // 'top.toString()',
                                  'Africa Victory Tech',
                                  style: TextStyle(
                                      fontSize: 20.0, color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      background: Image(
                        image: AssetImage('assets/Ecowas24.png'),
                        // fit: BoxFit.fitWidth,
                        height: 100,
                      ),
                    ),
                  );
                }),
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    userInfo(context),
                    userSettings(context),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  //   return Positioned(
  //     top: top,
  //     right: 16.0,
  //     child: Transform(
  //       transform: Matrix4.identity()..scale(scale),
  //       alignment: Alignment.center,
  //       child: FloatingActionButton(
  //         heroTag: "btn1",
  //         onPressed: () {},
  //         child: Icon(Icons.camera_alt_outlined),
  //       ),
  //     ),
  //   );
  // }

  Widget userInfo(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(color: Colors.teal),
          width: double.infinity,
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text('About us',
              style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        Divider(
          thickness: 1,
          color: Colors.green[800],
        ),
        userListTile(context, "Email", "valeryghn10@gmail.com", Icons.email),
        userListTile(context, "Phone Number", "0776 589 443", Icons.phone),
        userListTile(
            context, "Powered by", "Africa Victory Tech", Icons.ac_unit_sharp),
        userListTile(context, "Email", "valeryghn10@gmail.com", Icons.email),
        userListTile(context, "Phone Number", "0776 589 443", Icons.phone),
        userListTile(
            context, "Powered by", "Africa Victory Tech", Icons.ac_unit_sharp),
        userListTile(context, "Email", "valeryghn10@gmail.com", Icons.email),
        userListTile(context, "Phone Number", "0776 589 443", Icons.phone),
        userListTile(
            context, "Powered by", "Africa Victory Tech", Icons.ac_unit_sharp),
        userListTile(context, "Email", "valeryghn10@gmail.com", Icons.email),
        userListTile(context, "Phone Number", "0776 589 443", Icons.phone),
        userListTile(
            context, "Powered by", "Africa Victory Tech", Icons.ac_unit_sharp),
      ],
    );
  }

  Widget userSettings(BuildContext context) {
    final _themeChanger = Provider.of<DarkThemProvider>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(top: 20, left: 20),
          child: Text('Settings',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        ),
        Divider(
          thickness: 1,
          color: Colors.grey,
        ),
        ListTileSwitch(
          value: _themeChanger.darkTheme,
          leading: Icon(Ionicons.md_moon),
          onChanged: (value) {
            setState(() {
              _themeChanger.darkTheme = value;
            });
          },
          visualDensity: VisualDensity.comfortable,
          switchType: SwitchType.cupertino,
          switchActiveColor: Colors.indigo,
          title: Text('Dark theme'),
        ),
        // userListTile(context, "Logout", "", Icons.logout),
      ],
    );
  }

  Widget userListTile(
    BuildContext context,
    String title,
    String subTitle,
    IconData icon,
  ) {
    return Material(
      child: InkWell(
        splashColor: Theme.of(context).splashColor,
        child: ListTile(
          onTap: () {},
          title: Text(title),
          subtitle: Text(subTitle),
          leading: Icon(icon),
        ),
      ),
    );
  }
}
