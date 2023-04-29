import 'package:flutter/material.dart';

class Circle_Container extends StatelessWidget {
   Circle_Container({Key? key, required this.Container_color, required this.top_change, required this.left_change, required this.container_height, required this.container_width}) : super(key: key);
   Color Container_color ;
   double top_change ;
   double left_change ;
   double container_height ;
   double container_width ;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left:left_change,
      top:top_change ,
      child: SafeArea(
        child: Container(
            height: container_height,
            width: container_width,

            decoration:  BoxDecoration(
                color: Container_color, shape: BoxShape.circle)),
      ),
    );
  }
}
