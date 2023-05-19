import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../constants.dart';
import '../../../models/fakeDATA.dart';

class cancel_order extends StatelessWidget {
  const cancel_order({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Column(
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
                  height: 28.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text("Order Number :",style: TextStyle(fontSize: 16,color: Ktextcolor),),
                    SizedBox(width: 23.w,),
                    const Text("#12345",style: TextStyle(fontSize: 16,color: KPrimarycolor))
                  ],
                ),
                  SizedBox(
                    height: 56.h,
                  ),
                Center(
                  child: Text(
                    "Do you really want to cancel\nyour order from star Bucks ?", // create class field for the position ,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400,
                      color: Ktextcolor,
                    ),
                  ),
                ),
                SizedBox(
                  height: 52.h,
                ),
                 Padding(
                  padding: EdgeInsets.symmetric(horizontal:40.0.w),
                  child: const TextField(
                    decoration: InputDecoration(
                      hintText: "Write a reason why"
                    ),
                  ),
                )
            ]),
        ),
      ));
  }
}