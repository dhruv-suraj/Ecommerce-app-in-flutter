import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final url="https://www.google.com/url?sa=i&url=https%3A%2F%2Fwww.theverge.com%2F2020%2F10%2F21%2F21527437%2Fjared-leto-joker-justice-league-snyder-cut&psig=AOvVaw3m1ruTN0Y9cFqSogptfsLx&ust=1632718677535000&source=images&cd=vfe&ved=0CAsQjRxqFwoTCLjwm6Htm_MCFQAAAAAdAAAAABAD";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  // decoration: BoxDecoration(
                  //   color: Colors.white,
                  // ),
                    accountName: Text("Dhruv Suraj"),
                    accountEmail: Text("dhruv.suraj@somaiya.edu"),
                    currentAccountPicture: CircleAvatar(
                      backgroundImage: NetworkImage(url),
                    )
                )
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text("Home",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.info,
                color: Colors.white,
              ),
              title: Text("About Us",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.phone,
                color: Colors.white,
              ),
              title: Text("Contact Us",style: TextStyle(color: Colors.white),),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text("Email me",style: TextStyle(color: Colors.white),),
            )
          ],
        ),
      ),
    );
  }
}
