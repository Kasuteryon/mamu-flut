// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/User/bloc/bloc_user.dart';
import 'package:trips/User/model/user.dart';

class ProfileInfo extends StatelessWidget {
  //const ProfileInfo({ Key? key }) : super(key: key);

  UserModel? user;

  ProfileInfo(@required this.user);

  UserBloc? userBloc;

  @override
  Widget build(BuildContext context) {
    final photo = Container(
      margin: EdgeInsets.only(top: 90.0, left: 20.0),
      width: 90.0,
      height: 90.0,
      decoration: BoxDecoration(
          border: Border.all(width: 2, color: Colors.white),
          shape: BoxShape.circle,
          image: DecorationImage(
              image: NetworkImage(user!.photoURL), fit: BoxFit.cover)),
    );

    final userName = Container(
      margin: EdgeInsets.only(left: 20.0, top: 130.0),
      child: Text(
        user!.name,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Epilogue", fontSize: 20.0, color: Colors.white),
      ),
    );

    final userInfo = Container(
      margin: EdgeInsets.only(left: 20.0, top: 10.0),
      child: Text(
        user!.email,
        textAlign: TextAlign.left,
        style: TextStyle(
            fontFamily: "Epilogue", fontSize: 16.0, color: Color(0XFFa3a5a7)),
      ),
    );

    final userDetail = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [userName, userInfo],
    );

    final detailProfile = Container(
      padding: EdgeInsets.only(left: 12, top: 85, right: 12),
      margin: EdgeInsets.only(top: 20.0),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 12, right: 15),
            child: Text.rich(TextSpan(children: [
              TextSpan(
                  text: "Ernesto Lebni\n",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontFamily: "Epilogue")),
              TextSpan(
                  text: "lebni123@hotmail.com",
                  style: TextStyle(
                      color: Colors.white24,
                      fontSize: 16,
                      fontFamily: "Epilogue"))
            ])),
          )
        ],
      ),
    );

    return Row(
      children: [photo, userDetail],
    );
  }
}
