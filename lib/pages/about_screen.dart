import 'package:ecowas24/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
      body: Center(
        child: Text(
          "About Screen",
          style: TextStyle(fontSize: 28),
        ),
      ),
      drawer: AppDrawer(),
    );
  }
}
