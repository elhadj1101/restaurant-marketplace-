import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/welcome.dart';

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


