import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/signUP/sign_up.dart';
import 'Phone_reg_page/phone_reg_page.dart';

class Email_or_phone extends StatelessWidget {
  const Email_or_phone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: KPrimarycolor,
        body: Stack(children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            child: Image.asset(
              "assets/images/realwelcome.png",
              fit: BoxFit.fitWidth,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xFF191B2F)])),
          ),
          Padding(
            padding: const EdgeInsets.all(58.0),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Signup_page(),
                      ));
                    },
                    style: ElevatedButton.styleFrom(
                        minimumSize:  Size(315.w, 54.h),
                        shape:  RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2.w),
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                        ),
                        backgroundColor: KPrimarycolor.withOpacity(0.7)),
                    icon: const Icon(Icons.email),
                    label:  Text(
                      "start with email",
                      style: TextStyle(
                          fontSize: 18.sp, color: Colors.white),
                    ),
                  ),
                   SizedBox(
                    height: 30.h,
                  ),
                  ElevatedButton.icon(
                    onPressed: () {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => phone_reg_page(),
                      ));
                    },
                    label:  Text(
                      "start with phone",
                      style: TextStyle(
                          fontSize: 18.sp, color: Colors.white),
                    ),

                    icon: const Icon(Icons.phone),
                    style: ElevatedButton.styleFrom(

                        minimumSize:  Size(315.w, 54.h),
                        shape:  RoundedRectangleBorder(
                          side: BorderSide(color: Colors.white, width: 2.w),
                          borderRadius: const BorderRadius.all(Radius.circular(30)),
                        ),
                        backgroundColor: KPrimarycolor.withOpacity(0.7)),

                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
