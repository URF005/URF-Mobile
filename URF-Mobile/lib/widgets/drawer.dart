import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class mydrawer extends StatelessWidget {
  const mydrawer({super.key});

  @override
  Widget build(BuildContext context) {
    const imageurl =
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRjzUj_SfApzgMPMKioJxEN3vIsQKbBFJp1Cw&usqp=CAU";
    return Drawer(
      child: Container(
        color: Colors.blue,
        child: ListView(
          padding: EdgeInsets.zero,
          children: const [
            DrawerHeader(
                padding: EdgeInsets.zero,
                child: UserAccountsDrawerHeader(
                  margin: EdgeInsets.zero,
                  accountName: Text(
                    "Usama Rehan Farooqi",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  accountEmail: Text("ur476902@gmail.com",
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15)),
                  currentAccountPicture: CircleAvatar(
                    backgroundImage: NetworkImage(imageurl),
                  ),
                )),
            ListTile(
              leading: Icon(
                CupertinoIcons.home,
                color: Colors.white,
              ),
              title: Text(
                "Home",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.profile_circled,
                color: Colors.white,
              ),
              title: Text(
                "Profile",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.mail,
                color: Colors.white,
              ),
              title: Text(
                "Email me",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
            ),
            ListTile(
              leading: Icon(
                CupertinoIcons.cart,
                color: Colors.white,
              ),
              title: Text(
                "Your cart",
                style: TextStyle(color: Colors.white),
                textScaleFactor: 1.2,
              ),
            )
          ],
        ),
      ),
    );
  }
}
