import 'package:flutter/material.dart';
import 'package:trips/Place/model/place.dart';

class UserModel {
  final String uid;
  final String name;
  final String email;
  final String photoURL;
  final List<Place> myPlaces;
  final List<Place> myFavoritePlaces;

  UserModel(
      {required this.uid,
      required this.name,
      required this.email,
      required this.photoURL,
      required this.myPlaces,
      required this.myFavoritePlaces});
}
