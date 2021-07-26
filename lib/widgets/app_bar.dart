import 'package:ecowas24/pages/user.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  @override
  PreferredSizeWidget build(BuildContext context) {
    return AppBar(
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
        // PopupMenuButton(
        //   icon: Icon(Icons.more_vert),
        //   itemBuilder: (item) => [
        //     PopupMenuItem(
        //       child: Text("Login"),
        //       value: "Login",
        //     )
        //   ],
        // ),
        IconButton(onPressed: ()=>Navigator.of(context).pushNamed(UserInfoScreen.routeName), icon: Icon(Icons.settings),),
      ],
    );
  }
}
