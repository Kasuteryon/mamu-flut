import 'package:trips/User/model/user.dart';

class Place {
  String? uid;
  String name;
  String description;
  String? uriImage;
  int likes;

  Place(
      {this.uid,
      required this.name,
      required this.description,
      this.uriImage,
      required this.likes});
}
