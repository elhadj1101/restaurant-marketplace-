import 'package:flutter/material.dart';

import '../constants.dart';

class default_button extends StatelessWidget {
  const default_button({Key? key, required this.text, required this.x, required this.y, required this.button_color}) : super(key: key);
  final String text ;
  final double x,y ;
  final Color  button_color;

  @override
  Widget build(BuildContext context) {
    return  ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width/x,
              MediaQuery.of(context).size.height / y),
          elevation: 10,
          backgroundColor: button_color,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50))),
      child:  Text(
        text,
        style: const  TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: 20,
          color: Colors.white,
        ),
      ),
    );
  }
}
