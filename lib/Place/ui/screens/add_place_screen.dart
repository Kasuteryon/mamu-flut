// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:image_picker/image_picker.dart';
import 'package:trips/Place/model/place.dart';
import 'package:trips/Place/ui/widgets/card_image.dart';
import 'package:trips/Place/ui/widgets/location_input.dart';
import 'package:trips/User/bloc/bloc_user.dart';
import 'package:trips/widgets/button.dart';
import 'package:trips/widgets/gradient_back.dart';
import 'package:trips/widgets/text_input.dart';
import 'package:trips/widgets/title_header.dart';

class AddPlaceScreen extends StatefulWidget {
  PickedFile image;

  AddPlaceScreen({required this.image});

  @override
  _AddPlaceScreenState createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends State<AddPlaceScreen> {
  @override
  Widget build(BuildContext context) {
    UserBloc userBloc = BlocProvider.of<UserBloc>(context);
    final _controllerTitlePlace = TextEditingController();
    final _controllerDescriptionPlace = TextEditingController();

    return Scaffold(
      body: Stack(
        children: [
          GradientBack(title: "Añadir Pieza:", altura: 300.0),
          Row(
            children: [
              Container(
                padding: EdgeInsets.only(top: 25.0, left: 5.0),
                child: SizedBox(
                  height: 45.0,
                  width: 45.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Flexible(
                child: Container(
                  padding: EdgeInsets.only(top: 45.0, left: 20.0),
                  child: TitleHeader(
                    title: "Añadir Pieza",
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 120.0, bottom: 20.0),
            child: ListView(
              children: [
                // Widget foto
                Container(
                  margin:
                      EdgeInsets.only(bottom: 30.0, right: 20.0, left: 20.0),
                  alignment: Alignment.center,
                  child: CardImage(
                    pathImage: widget.image.path,
                    iconData: Icons.camera_enhance_rounded,
                    width: 400.0,
                    height: 250.0,
                    left: 0.0,
                    isUploading: true,
                    onPressed: () {},
                  ),
                ),

                // Textfield de Título
                Container(
                  margin: EdgeInsets.only(bottom: 20.0),
                  child: TextInput(
                    hintText: "Digita título",
                    inputType: TextInputType.name,
                    maxLines: 1,
                    controller: _controllerTitlePlace,
                  ),
                ),
                TextInput(
                  hintText: "Digita descripción",
                  inputType: TextInputType.multiline,
                  maxLines: 6,
                  controller: _controllerDescriptionPlace,
                ),
                Container(
                  margin: EdgeInsets.only(top: 20.0),
                  child: LocationInput(
                    hintText: "Ingresa ubicación",
                    iconData: Icons.location_on_outlined,
                    controller: TextEditingController(),
                  ),
                ),
                Container(
                  width: 70.0,
                  child: ButtonPurple(
                    buttonText: "Agregar lugar",
                    onPressed: () {
                      // 1. Firebase Storage para
                      // el URL de la imagen
                      userBloc.currentUser.then((User? user) {
                        if (user != null) {
                          String uid = user.uid;
                          String path = "$uid/${DateTime.now().toString()}.jpg";

                          userBloc
                              .uploadFile(path, widget.image)
                              .then((UploadTask uploadTask) => {
                                    uploadTask.then((TaskSnapshot snapshot) {
                                      snapshot.ref
                                          .getDownloadURL()
                                          .then((urlImage) {
                                        print(urlImage);

                                        // 2.Cloud Firestore para
                                        // el resto de campos

                                        userBloc
                                            .updatePlaceData(Place(
                                                name:
                                                    _controllerTitlePlace.text,
                                                description:
                                                    _controllerDescriptionPlace
                                                        .text,
                                                likes: 0,
                                                uriImage: urlImage))
                                            .whenComplete(() {
                                          print("TERMINO CORRECTAMENTE");
                                          Navigator.pop(context);
                                        });
                                      });
                                    })
                                  });
                        }
                      });
                    },
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
