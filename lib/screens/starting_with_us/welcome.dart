import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/email_or_phone_page.dart';
import 'login/Login_page.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
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
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(20.w, 160.h, 64.w, 19.h),
                child: RichText(
                    text:  TextSpan(children: [
                  TextSpan(
                      text: "Welcome to ",
                      style: TextStyle(
                          fontFamily: "sofiapro",
                          color: Ktextcolor,
                          fontWeight: FontWeight.w700,
                          fontSize: 45.sp)),
                  TextSpan(
                      text: "\nTabaki",
                      style: TextStyle(
                          fontFamily: "sofiapro",
                          fontSize: 53.sp,
                          fontWeight: FontWeight.w700,
                          color: KPrimarycolor)),
                ])),
              ),
               SizedBox(
                height: 19.h,
              ),
               Padding(
                padding: EdgeInsets.only(left: 20.w),
                child: Text(
                  "Your favourite foods delivered \nfast at your door.",
                  style: TextStyle(
                      color: Color(0xFF30384F),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w400),
                ),
              ),
               SizedBox(
                height: 200.h,
              ),
              Padding(
                padding:  EdgeInsets.only(bottom: 20.0.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // column of under sign up with
                  children: [
                    Row(children:  <Widget>[
                      Expanded(
                          child: Divider(
                        indent: 44.w,
                        color: const Color(0xFFFFFFFF),
                        endIndent: 17.w,
                      )),
                      const Text(
                        " sign up with ",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Color(0xFFFFFFFF),
                        ),
                      ),
                      Expanded(
                          child: Divider(
                        endIndent: 38.w,
                        color: const Color(0xFFFFFFFF),
                        indent: 17.w,
                      )),
                    ]),
                     SizedBox(
                      height: 18.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      // Row of facebook and google button
                      children:  [
                        facebookbutton(),
                        SizedBox(
                          width: 30.w,
                        ),
                        googlebutton()
                      ],
                    ),
                     SizedBox(
                      height: 23.h,
                    ),
                    const email_or_phonebutton(),
                     SizedBox(
                      height: 30.h,
                    ),
                    // Row of already have an account and sign in button
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                         Text(
                          "Already have an account? ",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                         SizedBox(
                          width: 5.w,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Login_page(),
                            ));
                          },
                          child:  Text(
                            "Sign In",
                            style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w500,
                                color: Colors.white,
                                decoration: TextDecoration.underline),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}

// google button
class googlebutton extends StatelessWidget {
  const googlebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: Primarybuttonstyle,
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
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
        ));
  }
}

//facebook button
class facebookbutton extends StatelessWidget {
  const facebookbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon:  Icon(
        Icons.facebook,
        color: const Color(0xFF1877F2),
        size: 42.r,
      ),
      label:  Text(
        "FACEBOOK",
        style: welcometextstyle,
      ),
      style: Primarybuttonstyle,
    );
  }
}

class email_or_phonebutton extends StatelessWidget {
  const email_or_phonebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const  Email_or_phone(),
        ));
      },
      style: ElevatedButton.styleFrom(
        minimumSize:  Size(315.w, 54.h),
        shape:  RoundedRectangleBorder(
          side: BorderSide(color: Colors.white,width: 2.w),
          borderRadius: const  BorderRadius.all(Radius.circular(30)),
        ),
        backgroundColor: Colors.grey.withOpacity(0.45),
      ),
      child: const Text("Start with email or phone"),
    );
  }
}
