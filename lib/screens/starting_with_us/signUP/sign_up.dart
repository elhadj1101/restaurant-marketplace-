import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/signUP/signupcontents.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/widgets/circle_container.dart';

class Signup_page extends StatelessWidget {
  const Signup_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children:  [
        // -110 , 300
        Circle_Container(
            Container_color: KPrimarycolor,
            top_change: -110.h,
            left_change: 300.w,
            container_height: 150.h,
            container_width: 150.w),
        Circle_Container(
            Container_color: KPrimarycolor,
            top_change: -120.h,
            left_change: -75.w,
            container_height: 150.h,
            container_width: 150.w),
        Circle_Container(
            Container_color: Colors.white,
            top_change: -74.h,
            left_change: -35.w,
            container_height: 80.h,
            container_width: 80.w),

        Circle_Container(
            Container_color: KLightcolor,
            top_change: -140.h,
            left_change: 30.w,
            container_height: 160.h,
            container_width: 160.w),
        Sign_up_content(),
      ]),
    );
  }
}
