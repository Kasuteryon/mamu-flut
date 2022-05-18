// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';

class CreateIconButton extends StatefulWidget {
  final VoidCallback onPressed;

  IconData iconData = Icons.ac_unit;
  bool mini = false;
  bool active = false;

  CreateIconButton(this.iconData,
      {required this.mini, required this.active, required this.onPressed});

  @override
  _CreateIconButtonState createState() => _CreateIconButtonState();
}

class _CreateIconButtonState extends State<CreateIconButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: InkWell(
      onTap: widget.onPressed,
      child: Container(
        height: widget.mini == true ? 35 : 55,
        width: widget.mini == true ? 35 : 55,
        child: Center(
          child: Icon(
            widget.iconData,
            color: Color.fromARGB(255, 250, 105, 139),
            size: widget.mini == true ? 20 : 45,
          ),
        ),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: widget.active ? Colors.white : Colors.white54,
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
            ]),
      ),
    ));
  }
}
