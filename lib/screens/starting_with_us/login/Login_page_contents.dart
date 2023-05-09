import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_marketplace_h/Auth.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/Home_screen.dart';
import '../../../constants.dart';
import '../../../widgets/default_button.dart';
import '../Reset_pass_page/reset_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_page_contents extends StatefulWidget {
  const Login_page_contents({Key? key}) : super(key: key);

  @override
  State<Login_page_contents> createState() => _Login_page_contentsState();
}

class _Login_page_contentsState extends State<Login_page_contents> {
  bool isvisible = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  Future signIn() async {
    print("dkhel");
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim());
      
   Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Auth(),
                    ));

  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(30.w, 30.h, 30.w, 0.h),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 40.h,
              ),
              Text(
                'Log in',
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
                controller: _emailController,
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
                controller: _passwordController,
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
                height: 60.h,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 40.0.w, vertical: 0.h),
                child: ElevatedButton(
                    onPressed: () {
                      signIn();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: KPrimarycolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 30, horizontal: 100)),
                    child: Text(
                      "Sign In".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )),
              ),
              SizedBox(
                height: 40.h,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => reset_password_page(),
                    ));
                  },
                  child: Text(
                    'Forgot password ? ',
                    style: TextStyle(
                        fontSize: 15.sp,
                        color: KPrimarycolor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 2.h,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: const BoxDecoration(
                      color: Kverylighttextcolor,
                      gradient: LinearGradient(
                        colors: [Kverylighttextcolor, KLightcolor],
                      ),
                    ),
                  ),
                  Text(
                    '   Sign in with    ',
                    style: TextStyle(
                        color: Klighttextcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp),
                  ),
                  Container(
                    height: 2.h,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: const BoxDecoration(
                      color: Kverylighttextcolor,
                      gradient: LinearGradient(
                        colors: [KLightcolor, Kverylighttextcolor],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 40.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.facebook,
                      color: const Color(0xFF1877F2),
                      size: 35.r,
                    ),
                    label: Text(
                      "FACEBOOK",
                      style: welcometextstyle,
                    ),
                    style: Primarybuttonstyle,
                  ),
                  ElevatedButton(
                      onPressed: () {},
                      style: Primarybuttonstyle,
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Row(
                          // Row of Google logo and text google
                          children: [
                            Image.asset("assets/images/google.png"),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              "GOOGLE",
                              style: welcometextstyle,
                            ),
                          ],
                        ),
                      ))
                ],
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
