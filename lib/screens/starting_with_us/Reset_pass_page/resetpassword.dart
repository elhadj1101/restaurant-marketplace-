import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_marketplace_h/widgets/default_button.dart';

import '../../../constants.dart';

class resetpassword extends StatefulWidget {
  const resetpassword({Key? key}) : super(key: key);

  @override
  State<resetpassword> createState() => _resetpasswordState();
}

class _resetpasswordState extends State<resetpassword> {
  final _emailController = TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
  }

  Future resetPassword() async {
    try {
      await FirebaseAuth.instance.sendPasswordResetEmail(
        email: _emailController.text.trim(),
      );
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
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
                height: 60.h,
              ),
              Text(
                'Reset Password ',
                style: TextStyle(
                    color: Ktextcolor,
                    fontSize: 40.sp,
                    fontFamily: GoogleFonts.roboto().fontFamily,
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
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w400),
              ),
              SizedBox(
                height: 40.h,
              ),
              TextFormField(
                controller: _emailController,
                cursorColor: KPrimarycolor,
                onTap: () {},
                decoration: InputDecoration(
                  suffixIconColor: Klighttextcolor,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                  suffixIcon: Icon(
                    Icons.email,
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
                      borderSide: BorderSide(
                        color: KPrimarycolor,
                        width: 2.w,
                      )),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 0.h),
                child: ElevatedButton(
                    onPressed: () {
                      resetPassword();
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: KPrimarycolor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50.0),
                        ),
                        padding: EdgeInsets.symmetric(
                            vertical: 15, horizontal: 100)),
                    child: Text(
                      "Reset".toUpperCase(),
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w400),
                    )),
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
