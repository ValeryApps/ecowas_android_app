import 'package:ecowas24/constants/countries.dart';
import 'package:ecowas24/pages/on_the_web_news.dart';
import 'package:ecowas24/widgets/CountryCard.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountriesScreen extends StatelessWidget {
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
     body: Container(

       child: GridView(
         gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
           childAspectRatio: 3 / 2,
           crossAxisCount: 2,
           crossAxisSpacing: 10,
           mainAxisSpacing: 10,
         ),
           children : countries.map((country) {
            
             return CountryCard(countryCode: country["code"],
           countryName: country["name"], navigateTo: ()=>Navigator
                   .of(context).pushNamed(OnTheWebScreen.routeName, arguments: country["name"]),);
           }).toList()


       ),
     ),
   );
  }
}
