import 'package:ecowas24/models/website.dart';
import 'package:ecowas24/pages/webview_screen.dart';
import 'package:ecowas24/widgets/app_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class OnTheWebScreen extends StatelessWidget {
  static const routeName = "on_the_web";
  @override
  Widget build(BuildContext context) {
    final countryName = ModalRoute.of(context).settings.arguments as String;
    final websites =
        webs.where((web) => web.countryName == countryName).toList();
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
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Container(
                width: 150,
                child: Text("$countryName Press",
                    style: TextStyle(
                        fontSize: 15,
                        color: Colors.green,
                        fontWeight: FontWeight.bold)),
              ),
            ),
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
      body: websites.length == 0
          ? Padding(
              padding: const EdgeInsets.all(8.0),
              child: Center(
                  child: Text(
                "$countryName medias are not available for now",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              )),
            )
          : Container(
              padding: EdgeInsets.all(15),
              child: GridView(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: 3 / 2,
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                ),
                children: websites
                    .map(
                      (web) => InkWell(
                        child: Card(
                          elevation: 8,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Stack(
                              children: [
                                web.imageUrl.endsWith(".svg")
                                    ? SvgPicture.network(
                                        web.imageUrl,
                                      )
                                    : Image.network(
                                        web.imageUrl,
                                        // fit: BoxFit.cover,
                                      ),
                                Positioned(
                                  child: Text(
                                    web.name,
                                    style: TextStyle(),
                                  ),
                                  bottom: 0,
                                ),
                              ],
                            ),
                          ),
                        ),
                        onTap: () => Navigator.of(context).pushNamed(
                            WebViewScreen.routeName,
                            arguments: web.id),
                      ),
                    )
                    .toList(),
              ),
            ),
      drawer: AppDrawer(),
    );
  }
}
