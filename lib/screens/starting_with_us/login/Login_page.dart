
import 'package:flutter/material.dart';
import 'package:restaurant_marketplace_h/constants.dart';

import 'Login_page_contents.dart';



class Login_page extends StatelessWidget {
  const Login_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
          children: [

            Positioned(
              left:300,
              top:-110 ,
              child: SafeArea(
                child: Container(
                    height: 150,
                    width: 150,

                    decoration: const BoxDecoration(

                        color: KPrimarycolor, shape: BoxShape.circle)),
              ),
            ),
            Positioned(
              right:320,
              top:-120 ,
              child: SafeArea(
                child: Container(
                    height: 150,
                    width: 150,

                    decoration: const BoxDecoration(
                        color: KPrimarycolor, shape: BoxShape.circle)),
              ),
            ),
            Positioned(
              right:350,
              top:-74 ,
              child: SafeArea(
                child: Container(
                    height: 80,
                    width: 80,

                    decoration: const BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle)),
              ),
            ),
            Positioned(
              left:30,
              top:-140 ,
              child: SafeArea(
                child: Container(
                    height: 150,
                    width: 150,

                    decoration: const BoxDecoration(

                        color: KLightcolor, shape: BoxShape.circle)),
              ),
            ),
            const Login_page_contents(),


          ]),
    );
  }
}
