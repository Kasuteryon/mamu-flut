// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expansion_widget/expansion_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterfire_ui/firestore.dart';
import 'package:trips/Place/ui/widgets/description_place.dart';
import 'package:trips/Place/ui/screens/header_appbar.dart';
import 'package:trips/Place/ui/widgets/review_list.dart';
import 'dart:math' as math;

class HomeTrips extends StatelessWidget {
  HomeTrips({Key? key}) : super(key: key);

  final queryPost = FirebaseFirestore.instance.collection("Contact");

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // ListView(
        //   children: [
        //     DescriptionPlace("Nicaragua", 4,
        //         "Regocíjate con las únicas y maravillosas experiencias que los destinos turísticos de nuestro país pueden ofrecerte. Descubre Cada uno de ellos y disfruta la experiencia Nicaraguense."),
        //     ReviewList()
        //   ],
        // ),
        HeaderAppBar(),
        Container(
          margin: EdgeInsets.only(top: 350, left: 20.0, right: 20.0),
          child: FirestoreListView(
            query: queryPost,
            pageSize: 20,
            shrinkWrap: true,
            itemBuilder: (context, snapshot) {
              dynamic snap = snapshot.data();
              return ExpansionWidget(
                initiallyExpanded: false,
                titleBuilder: (double animationValue, _, bool isExpanded,
                    toogleFunction) {
                  return InkWell(
                      onTap: () => toogleFunction(animated: true),
                      child: Padding(
                        padding: EdgeInsets.all(8),
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              width: 20.0,
                            ),
                            Expanded(
                                child: Text(
                              "${snap['Name']}- Ver Más",
                              style: TextStyle(
                                  fontSize: 17.0,
                                  fontFamily: "Epilogue",
                                  color: Colors.blueGrey,
                                  fontWeight: FontWeight.bold),
                            )),
                            Transform.rotate(
                              angle: math.pi * animationValue / 2,
                              child: Icon(
                                Icons.arrow_right,
                                size: 40,
                                color: Color.fromARGB(255, 250, 105, 139),
                              ),
                              alignment: Alignment.center,
                            )
                          ],
                        ),
                      ));
                },
                content: Container(
                  padding: EdgeInsets.only(right: 15.0, left: 15.0),
                  margin: EdgeInsets.only(right: 15.0, left: 15.0, top: 15.0),
                  width: 400.0,
                  //height: 100.0,
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.topCenter,
                        margin:
                            EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "Correo: ${snap["Email"]}",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "Epilogue",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.clip),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 7.0),
                              )
                            ]),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: 10.0, right: 5.0, left: 5.0),
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          "N°: ${snap["PhoneNumber"]}",
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "Epilogue",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 7.0),
                              )
                            ]),
                      ),
                      Container(
                        margin: EdgeInsets.only(
                            top: 10.0, right: 5.0, left: 5.0, bottom: 10.0),
                        padding: EdgeInsets.all(20.0),
                        child: Text(
                          snap["Comments"],
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: "Epilogue",
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis),
                        ),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black12,
                                blurRadius: 15.0,
                                offset: Offset(0.0, 7.0),
                              )
                            ]),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        )
      ],
    );
  }
}
