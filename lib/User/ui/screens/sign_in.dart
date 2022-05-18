// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/User/bloc/bloc_user.dart';
import 'package:trips/User/model/user.dart';
import 'package:trips/trips.dart';
import 'package:trips/widgets/button_green.dart';
import 'package:trips/widgets/gradient_back.dart';

class SignInScreen extends StatefulWidget {
  const SignInScreen({Key? key}) : super(key: key);

  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  UserBloc? userBloc;
  double? screenWidth;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    userBloc = BlocProvider.of(context);
    return _handleCurrentSession();
  }

  Widget _handleCurrentSession() {
    return StreamBuilder(
      stream: userBloc!.authStatus,
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        //
        if (!snapshot.hasData || snapshot.hasError || snapshot == null) {
          return signInGoogleUi();
        } else {
          return Trips();
        }
      },
    );
  }

  Widget signInGoogleUi() {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          GradientBack(
            altura: double.infinity,
            title: "",
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Flexible(
                child: Container(
                  width: screenWidth,
                  child: Text(
                    "¡Bienvenida al \n administrador Mamushka!",
                    style: TextStyle(
                        fontFamily: "Epilogue",
                        fontSize: 37.0,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ButtonGreen(
                  buttonText: "Iniciar con Google",
                  onPressed: () {
                    userBloc!.signIn().then((UserCredential user) {
                      print("................");
                      print(
                          "El usuario es ${user.additionalUserInfo?.profile}");

                      userBloc?.updateUserData(UserModel(
                          uid: user.user!.uid,
                          name: user.user!.displayName!,
                          email: user.user!.email!,
                          photoURL: user.user!.photoURL!,
                          myPlaces: [],
                          myFavoritePlaces: []));
                    });
                  },
                  height: 60.0,
                  width: 300.0)
            ],
          )
        ],
      ),
    );
  }
}
