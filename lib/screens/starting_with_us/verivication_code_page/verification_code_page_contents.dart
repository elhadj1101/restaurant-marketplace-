import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
class Verification_Code_page_contents extends StatelessWidget {
  const Verification_Code_page_contents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = 1;
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
                'Verification Code ',
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
                'Please type the verification code sent to  useradress@gmail.com ',
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
              Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Otp_form(i: 1),
                      Otp_form(i: 2),
                      Otp_form(i: 3),
                      Otp_form(i: 4),
                    ],
                  )),
               SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('I don\'t receive a code !',
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Ktextcolor,
                        fontFamily: GoogleFonts
                            .roboto()
                            .fontFamily,
                      )),
                  GestureDetector(

                    child: Text(' Please Resend',
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: KPrimarycolor,
                          fontFamily: GoogleFonts
                              .roboto()
                              .fontFamily,
                        )),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Otp_form extends StatelessWidget {
  const Otp_form({Key? key, required this.i}) : super(key: key);
  final int i;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75.h,
      width: 68.w,
      child: TextField(

        onChanged: (value) {
          if (i != 4) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          }
          if (i !=1) {
            if (value.length == 0) {
              FocusScope.of(context).previousFocus();
            }

          }
        },
        textAlignVertical: TextAlignVertical.center,
        cursorColor: KPrimarycolor,
        style: Theme
            .of(context)
            .textTheme
            .headlineMedium,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide:  BorderSide(
              color: Colors.black38,
              width: 2.w,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(
              width: 2.w,
              color: KPrimarycolor,
            ),
          ),
        ),
      ),
    );
  }
}
