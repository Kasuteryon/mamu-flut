// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:trips/Place/ui/screens/home.dart';
import 'package:trips/User/ui/screens/profile.dart';
import 'package:trips/Place/ui/screens/search.dart';

class TripsCupertino extends StatelessWidget {
  const TripsCupertino({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CupertinoTabScaffold(
      tabBar: CupertinoTabBar(items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.indigo),
            //title: Text("")
            label: "Inicio"),
        BottomNavigationBarItem(
            icon: Icon(Icons.search, color: Colors.indigo),
            //title: Text("")
            label: "Buscar"),
        BottomNavigationBarItem(
            icon: Icon(Icons.person, color: Colors.indigo),
            //title: Text("")
            label: "Perfil"),
      ]),
      tabBuilder: (BuildContext context, int index) {
        switch (index) {
          case 0:
            return CupertinoTabView(
              builder: (BuildContext context) => HomeTrips(),
            );
            break;
          case 1:
            return CupertinoTabView(
              builder: (BuildContext context) => SearcTrips(),
            );
            break;
          case 2:
            return CupertinoTabView(
              builder: (BuildContext context) => ProfileTrips(),
            );
            break;
          default:
            return CupertinoTabView(
              builder: (BuildContext context) => HomeTrips(),
            );
        }
      },
    ));
  }
}
