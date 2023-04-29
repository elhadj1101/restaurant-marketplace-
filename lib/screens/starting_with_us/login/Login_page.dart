
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_marketplace_h/constants.dart';

import 'Login_page_contents.dart';



class Login_page extends StatelessWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: [

            Positioned(
              left:300.w,
              top:-110.h ,
              child: SafeArea(
                child: Container(
                    height: 150.h,
                    width: 150.w,

                    decoration: const BoxDecoration(

                        color: KPrimarycolor, shape: BoxShape.circle)),
              ),
            ),
            Positioned(
              right:320.w,
              top:-120.h ,
              child: SafeArea(
                child: Container(
                    height: 150.h,
                    width: 150.w,

                    decoration: const BoxDecoration(
                        color: KPrimarycolor, shape: BoxShape.circle)),
              ),
            ),
            Positioned(
              right:350.w,
              top:-74.h ,
              child: SafeArea(
                child: Container(
                    height: 80.h,
                    width: 80.w,

                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle)),
              ),
            ),
            Positioned(
              left:30.w,
              top:-140.h ,
              child: SafeArea(
                child: Container(
                    height: 150.h,
                    width: 150.w,

                    decoration: const BoxDecoration(

                        color: KLightcolor, shape: BoxShape.circle)),
              ),
            ),
            const Login_page_contents(),


          ]),
    );
  }
}
