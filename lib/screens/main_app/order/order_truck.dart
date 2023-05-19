import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_marketplace_h/widgets/default_button.dart';

import '../../../constants.dart';
import '../../../models/fakeDATA.dart';
import '../category/category_page.dart';

class order_truck extends StatelessWidget {
  const order_truck({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(17.0.w, 0.169*MediaQuery.of(context).size.height -75.26, 17.w, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset('assets/images/Rating.png'),
                    Padding(
                      padding: EdgeInsets.only(top: -0.105*MediaQuery.of(context).size.height + 192 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 120.r,
                            width: 120.r,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            alignment: Alignment.center,
                            child: Image.asset(
                              'assets/images/star_bucks.png',
                              height: 95.h,
                              width: 95.w,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                ),
                  ),
                  Text(
              myrestaurants[2].restaurant_name,
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              'La Mactaa Street ',
              // create class field for the position ,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Klighttextcolor,
              ),
            ),
            SizedBox(
              height: 120.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  color:  Color(0xffEEAE00),
                  size: 10,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  "Order is coming ", // create class field for the position ,
                  style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w400,
                    color: const Color(0xffEEAE00),
                  ),
                ),
              ],
            ),
             SizedBox(height: 10.h,),
                Text("Estimating time", style: TextStyle(
                    fontSize: 19.sp,
                    fontWeight: FontWeight.w400,
                    color: Ktextcolor,)),
                    SizedBox(height: 67.h,),
                     Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const default_button(text: "Cancel", x: 2.4, y: 15, button_color: Colors.grey),
                        SizedBox(width: 32.w,),
                        const default_button(text: "Call Driver", x: 2.4, y: 15, button_color: KPrimarycolor),
                      ],
                    )
    ]),
    );
  }
}