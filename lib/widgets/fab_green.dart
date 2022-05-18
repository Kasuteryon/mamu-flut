// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class FloatingActionButtonGreen extends StatefulWidget {
  final IconData iconData;
  final VoidCallback onPressed;

  const FloatingActionButtonGreen(
      {Key? key, required this.iconData, required this.onPressed})
      : super(key: key);

  @override
  _FloatingActionButtonGreenState createState() =>
      _FloatingActionButtonGreenState();
}

class _FloatingActionButtonGreenState extends State<FloatingActionButtonGreen> {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color(0xFF11DA53),
      mini: true,
      tooltip: "Me Gusta",
      child: Icon(widget.iconData),
      onPressed: widget.onPressed,
      heroTag: null,
    );
  }
}
