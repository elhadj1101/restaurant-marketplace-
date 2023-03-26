import 'dart:async';

import 'package:restaurant_marketplace_h/screens/login/Login_page.dart';
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
    Timer(Duration(seconds: 0), () {
      Navigator.of(context).push(MaterialPageRoute(builder: (_)=>welcome()));
    });

    return  

     Scaffold(
        backgroundColor: KPrimarycolor,
        body: Center(
          child: Image.asset(
            'assets/images/default-monochrome1.png',
            height: 170,
            width: 170,

          ),

        ),

  
    );
  }
}


