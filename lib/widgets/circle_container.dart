import 'package:flutter/material.dart';

import '../constants.dart';

class Circle_Container extends StatelessWidget {
  const Circle_Container({Key? key, required this.Container_color, required this.top_change, required this.left_change, required this.container_height, required this.container_width}) : super(key: key);
  final Color Container_color ;
  final double top_change ;
  final double left_change ;
  final double container_height ;
  final double container_width ;

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
