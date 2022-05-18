// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:dot_navigation_bar/dot_navigation_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/Place/ui/screens/home.dart';
import 'package:trips/Place/ui/screens/search.dart';
import 'package:trips/User/bloc/bloc_user.dart';
import 'package:trips/User/ui/screens/profile.dart';

class Trips extends StatefulWidget {
  const Trips({Key? key}) : super(key: key);

  @override
  _TripsState createState() => _TripsState();
}

class _TripsState extends State<Trips> {
  int indexTap = 2;
  UserBloc? userBloc;

  void onTapTapped(int index) {
    setState(() => indexTap = index);

    @override
    void initState() {
      super.initState();
      userBloc = UserBloc();
    }
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> widgetsChildren = [
      HomeTrips(),
      SearcTrips(),
      BlocProvider<UserBloc>(child: ProfileTrips(), bloc: UserBloc())
    ];

    return Scaffold(
      body: widgetsChildren[indexTap],
      extendBody: true,

      // DOT FLOATING NAVIGATION
      bottomNavigationBar: DotNavigationBar(
        currentIndex: indexTap,
        onTap: onTapTapped,
        enableFloatingNavBar: true,
        marginR: EdgeInsets.only(right: 40.0, left: 40.0, bottom: 25.0),
        borderRadius: 20.0,
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 20.0,
            // shadow
            spreadRadius: .5,
            // set effect of extending the shadow
            offset: Offset(
              0.0,
              5.0,
            ),
          )
        ],
        // dotIndicatorColor: Colors.black,
        items: [
          /// Home
          DotNavigationBarItem(
            icon: Icon(Icons.home),
            selectedColor: Colors.blue,
          ),

          /// Search
          DotNavigationBarItem(
            icon: Icon(Icons.search),
            selectedColor: Colors.teal,
          ),

          /// Profile
          DotNavigationBarItem(
            icon: Icon(Icons.person),
            selectedColor: Colors.orange,
          ),
        ],
      ),
    );
  }
}
