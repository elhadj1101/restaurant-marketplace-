import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/welcome.dart';

import 'constants.dart';

class splash_screen extends StatelessWidget {
   splash_screen({Key? key}) : super(key: key);




  @override

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 1), () {Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return const welcome()  ;
    },)) ;}) ;

    return Scaffold(
      backgroundColor: KPrimarycolor,
      body: Stack(
        children: [

          Positioned(
            right: 0,
            top: 0,
            child: Transform.translate(
              offset: Offset(40.w, -55.h),
              child: Transform.scale(
                  scale: MediaQuery.of(context).size.height/1032.h,
                  child: Image.asset('assets/images/pizzaintro.png')),
            ),
          ),
          Center(
            child: Image.asset('assets/images/intro.png'),
          ),

        ],
      ),
    );
  }
}
