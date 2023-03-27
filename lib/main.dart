import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_marketplace_h/screens/Phone_reg_page/phone_reg_page.dart';
import 'package:restaurant_marketplace_h/screens/Reset_pass_page/reset_password_page.dart';
import 'package:restaurant_marketplace_h/screens/email_or_phone_page.dart';
import 'package:restaurant_marketplace_h/screens/login/Login_page.dart';
import 'package:restaurant_marketplace_h/screens/Phone_reg_page/phoneregistration.dart';
import 'package:restaurant_marketplace_h/screens/Reset_pass_page/resetpassword.dart';
import 'package:restaurant_marketplace_h/screens/signUP//sign_up.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/verivication_code_page/verification_code_page.dart';
import 'package:restaurant_marketplace_h/screens/welcome.dart';

void main() {
  runApp( MaterialApp(
      theme: ThemeData(
        fontFamily: GoogleFonts.roboto().fontFamily ,
      ),
      debugShowCheckedModeBanner: false,
      home:  MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Timer(const Duration(seconds: 2), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>welcome()));
    });

    return  

     Scaffold(
        backgroundColor: KPrimarycolor,
        body: Stack(
          children: [
            Positioned(
              right:0 ,
              top: 0,
              child: Image.asset(
                'assets/images/pizzaintro.png'
              ),
            ),
            Center(
              child: Image.asset(
                 'assets/images/intro.png'
               ),
            ),
          ],
        ),

  
    );
  }
}


