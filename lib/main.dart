// ignore_for_file: prefer_const_constructors

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:trips/Place/bloc/bloc_place.dart';
import 'package:trips/User/bloc/bloc_user.dart';
import 'package:trips/User/ui/screens/sign_in.dart';
import 'package:trips/trips.dart';
import 'package:trips/trips_cupertino.dart';

import 'package:flutter/services.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent, // transparent status ba
  ));
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      child: MaterialApp(
          title: 'Mamushka',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(primarySwatch: Colors.blue),
          home: SignInScreen()

          //const MyHomePage(title: 'Flutter Demo Home Page'),
          ),
      bloc: UserBloc(),
    );
  }
}
