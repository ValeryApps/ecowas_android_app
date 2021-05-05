import 'package:ecowas24/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class AboutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
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
