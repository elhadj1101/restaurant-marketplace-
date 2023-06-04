import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';

class default_button extends StatelessWidget {
   default_button(
      {Key? key,
      required this.text,
      required this.x,
      required this.y,
      required this.button_color,
      this.textsize,
      this.fontcolor,
      required this.function})
      : super(key: key);
  final String text;
  double? textsize =20.sp;
  Color? fontcolor = Colors.white;
  final double x, y;

  final Color button_color;
  final VoidCallback function;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: function,
      style: ElevatedButton.styleFrom(
          fixedSize: Size(MediaQuery.of(context).size.width / x,
              MediaQuery.of(context).size.height / y),
          elevation: 10,
          backgroundColor: button_color,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: Text(
        text,
        style: TextStyle(
          fontStyle: FontStyle.normal,
          fontSize: textsize,
          color: fontcolor,
        ),
      ),
    );
  }
}
