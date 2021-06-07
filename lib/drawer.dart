import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/clear_cache.dart';

import 'main.dart';


class DrawerNavigation extends StatefulWidget {
  @override
  _DrawerNavigationState createState() => _DrawerNavigationState();
}

class _DrawerNavigationState extends State<DrawerNavigation> {


  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: const BoxDecoration(
              color: Colors.blue,
            ),
            child: Container(
                alignment: Alignment.centerLeft,
                child: const Text(
                  'PPRA',
                  style: TextStyle(
                      fontSize: 20,
                      color: Colors.white54,
                      fontWeight: FontWeight.bold),
                )),
          ),
          ListTile(
            title:const Text(
              "PDf"
            ),
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>const MyHomePage(title:"Pdf")));
            },
          ),
          ListTile(
            title: const Text("Clear Cache"),
            onTap: () {
                Navigator.pushReplacementNamed(context, ClearCache.id);
            },
          )
        ],
      ),
    );
  }

}
