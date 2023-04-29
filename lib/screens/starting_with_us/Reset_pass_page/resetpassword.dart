import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_marketplace_h/widgets/default_button.dart';

import '../../../constants.dart';

class resetpassword extends StatelessWidget {
  const resetpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Padding(
        padding:  EdgeInsets.fromLTRB(30.w, 30.h, 30.w, 0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 60.h,
              ),
              Text(
                'Reset Password ',
                style: TextStyle(
                    color: Ktextcolor,
                    fontSize: 40.sp,
                    fontFamily: GoogleFonts
                        .roboto()
                        .fontFamily,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Please enter your email adress to request a password reset',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: GoogleFonts
                        .roboto()
                        .fontFamily,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 40.h,
              ),
              TextFormField(
                cursorColor: KPrimarycolor,
                onTap: () {},

                decoration: InputDecoration(
                  suffixIconColor: Klighttextcolor,
                  contentPadding:
                   EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  suffixIcon:
                      Icon(
                      Icons.email ,
                      size: 24.r,
                    ),


                  hintStyle: const TextStyle(
                    color: Kverylighttextcolor,
                  ),
                  labelText: 'email',
                  labelStyle: const TextStyle(
                    color: Klighttextcolor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      gapPadding: 14.w,
                      borderSide: const BorderSide(color: Ktextcolor)),
                  focusColor: KPrimarycolor,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      gapPadding: 14.w,
                      borderSide:  BorderSide(
                        color: KPrimarycolor,
                        width: 2.w,
                      )),
                ),
              ),
               SizedBox(
                height: 50.h,
              ),
                Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 40.0.w,vertical: 0.h),
                 child: const default_button(text: 'reset my password', x: 1.5, y: 13, button_color: KPrimarycolor),
               ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
      ),
    );
  }
}

