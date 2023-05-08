import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/widgets/default_button.dart';

import '../login/Login_page.dart';

class Sign_up_content extends StatefulWidget {
  const Sign_up_content({Key? key}) : super(key: key);

  @override
  State<Sign_up_content> createState() => _Sign_up_contentState();
}

class _Sign_up_contentState extends State<Sign_up_content> {
  bool isvisible = true;
  bool isvisible2 = true ;
  bool istaped = false;

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
                height: 40.h,
              ),
              Text(
                'Sign up',
                style: TextStyle(
                    color: Ktextcolor,
                    fontSize: 40.sp,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w700),
              ),
               SizedBox(
                height: 70.h,
              ),
              TextFormField(
                cursorColor: KPrimarycolor,
                decoration: InputDecoration(
                  contentPadding:
                       EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  suffixIconColor: Klighttextcolor,
                  suffixIcon: const Icon(
                    Icons.person,
                  ),
                  hintStyle: const TextStyle(
                    color: Kverylighttextcolor,
                  ),
                  labelText: 'Full name ',
                  labelStyle: const TextStyle(
                    color: Klighttextcolor,
                  ),
                  enabledBorder: OutlineInputBorder(

                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14.w,
                      borderSide: const BorderSide(color: Ktextcolor )),
                  focusColor: KPrimarycolor,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14.w,
                      borderSide:  BorderSide(
                        color: KPrimarycolor,
                        width: 2.w,
                      )),
                ),
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
                  suffixIcon: const Icon(
                    Icons.email,
                  ),
                  hintStyle: const TextStyle(
                    color: Kverylighttextcolor,
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Klighttextcolor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14.w,
                      borderSide: const BorderSide(color: Ktextcolor)),
                  focusColor: KPrimarycolor,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14.w,
                      borderSide:  BorderSide(
                        color: KPrimarycolor,
                        width: 2.w,
                      )),
                ),
              ),
               SizedBox(
                height: 40.h,
              ),
              TextFormField(
                cursorColor: KPrimarycolor,
                onTap: () {},
                obscureText: !isvisible,
                decoration: InputDecoration(
                  suffixIconColor: Klighttextcolor,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isvisible ? Icons.visibility : Icons.visibility_off,
                      size: 24.r,
                    ),
                    onPressed: () {
                      setState(() {
                        isvisible = !isvisible;
                      });
                    },
                  ),
                  hintStyle: const TextStyle(
                    color: Kverylighttextcolor,
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Klighttextcolor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14.w,
                      borderSide: const BorderSide(color: Ktextcolor)),
                  focusColor: KPrimarycolor,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14.w,
                      borderSide: BorderSide(
                        color: KPrimarycolor,
                        width: 2.w,
                      )),
                ),
              ),

              SizedBox(
                height: 40.h,
              ),
              TextFormField(
                cursorColor: KPrimarycolor,
                onTap: () {},
                obscureText: !isvisible2,
                decoration: InputDecoration(
                  suffixIconColor: Klighttextcolor,
                  contentPadding:
                  EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isvisible2 ? Icons.visibility : Icons.visibility_off,
                      size: 24.r,
                    ),
                    onPressed: () {
                      setState(() {
                        isvisible2 = !isvisible;
                      });
                    },
                  ),
                  hintStyle: const TextStyle(
                    color: Kverylighttextcolor,
                  ),
                  labelText: 'Confirm your Password',
                  labelStyle: const TextStyle(
                    color: Klighttextcolor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14.w,
                      borderSide: const BorderSide(color: Ktextcolor)),
                  focusColor: KPrimarycolor,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14.w,
                      borderSide:  BorderSide(
                        color: KPrimarycolor,
                        width: 2.w,
                      )),
                ),
              ),

               SizedBox(
                height: 60.h,
              ),

                 Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 40.0.w,vertical: 0.h),
                  child:const default_button(text: 'Sign up', x: 1.5, y: 13, button_color: KPrimarycolor),
                ) ,
               SizedBox(
                height: 40.h,
              ),
              Padding(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 120
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('already have an account ? ',
                        style: TextStyle(
                          fontSize: 13.sp,
                          color: Ktextcolor,
                          fontFamily: GoogleFonts.roboto().fontFamily,
                        )),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(builder:(context) => Login_page(),));

                      },
                      child:Text(' Sign in',
                          style: TextStyle(
                            fontSize: 15.sp,
                            color: KPrimarycolor,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                          )),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.h,
              )

            ],
          ),
        ),
      ),
    );
  }
}
