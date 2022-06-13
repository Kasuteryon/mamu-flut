import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:ui';

import 'package:trips/Place/ui/screens/add_place_screen.dart';

class BottomBlurModal extends StatefulWidget {
  BottomBlurModal({Key? key}) : super(key: key);

  @override
  State<BottomBlurModal> createState() => _BottomBlurModalState();
}

class _BottomBlurModalState extends State<BottomBlurModal> {
  List<dynamic> menuItems = [
    {
      "title": "Tomar Foto",
      "icon": Icons.camera_alt_rounded,
      "color": Colors.blue
    },
    {"title": "Galería", "icon": Icons.image, "color": Colors.pink},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180.0,
      child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20.0),
                    topRight: Radius.circular(20.0))),
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 4,
                    width: 50,
                    color: Colors.grey.shade200,
                  ),
                ),
                ListView.builder(
                  itemCount: menuItems.length,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
                      padding: EdgeInsets.only(top: 10.0, bottom: 10.0),
                      child: ListTile(
                        leading: Container(
                          height: 50.0,
                          width: 50.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30.0),
                              color: menuItems[index]["color"]),
                          child: Icon(
                            menuItems[index]["icon"],
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          menuItems[index]["title"],
                          style: TextStyle(
                              fontFamily: "Epilogue",
                              fontWeight: FontWeight.bold),
                        ),
                        onTap: () async {
                          final picker = ImagePicker();

                          if (index == 0) {
                            final picker = ImagePicker();

                            ImagePicker.platform
                                .pickImage(
                                    source: ImageSource.camera,
                                    maxHeight: 480,
                                    maxWidth: 640)
                                .then((image) {
                              if (image != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            AddPlaceScreen(image: image)));

                                print(image.path);
                              }
                            }).catchError((onError) => print(onError));
                          } else if (index == 1) {
                            final picker = ImagePicker();

                            ImagePicker.platform
                                .pickImage(
                                    source: ImageSource.gallery,
                                    maxHeight: 480,
                                    maxWidth: 640)
                                .then((image) {
                              if (image != null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (BuildContext context) =>
                                            AddPlaceScreen(image: image)));

                                print(image.path);
                              }
                            }).catchError((onError) => print(onError));
                          }
                        },
                      ),
                    );
                  },
                )
              ],
            ),
          )),
    );
  }
}
