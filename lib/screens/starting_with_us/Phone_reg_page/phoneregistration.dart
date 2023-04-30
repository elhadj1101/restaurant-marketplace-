import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:restaurant_marketplace_h/widgets/default_button.dart';

import '../../../constants.dart';

class phoneregistration extends StatelessWidget {
  const phoneregistration({Key? key}) : super(key: key);

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
                'Phone registration ',
                style: TextStyle(
                    color: Ktextcolor,
                    fontSize: 37.sp,
                    fontFamily: GoogleFonts
                        .roboto()
                        .fontFamily,
                    fontWeight: FontWeight.w700),
              ),
               SizedBox(
                height: 20.h,
              ),
              Text(
                'Enter your phone number to sign up with us ',
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
              IntlPhoneField(

                showCountryFlag: true,
                showDropdownIcon: true ,
                initialCountryCode: 'DZ' ,
                cursorColor: KPrimarycolor,
                disableLengthCheck: true,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(9),
                ],

                decoration: InputDecoration(


                  hintStyle: const TextStyle(
                    color: Kverylighttextcolor,
                  ),
                  labelText: 'phone number',
                  labelStyle: const TextStyle(
                    color: Klighttextcolor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Ktextcolor)),
                  focusColor: KPrimarycolor,
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 10.w,
                      borderRadius: BorderRadius.circular(11),
                      borderSide:  BorderSide(color: KPrimarycolor, width: 2.w,)
                  ),
                ),

              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding:  EdgeInsets.symmetric(horizontal: 40.0.w,vertical: 0.h),
                child: default_button(text: 'Sign up', x: 1.5, y: 13, button_color: KPrimarycolor),
              ),
              SizedBox(
                height: 20.h,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

