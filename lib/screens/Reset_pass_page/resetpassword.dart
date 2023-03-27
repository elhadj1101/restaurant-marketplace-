import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_marketplace_h/widgets/default_button.dart';

import '../../../constants.dart';

class resetpassword extends StatelessWidget {
  const resetpassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 60,
              ),
              Text(
                'Reset Password ',
                style: TextStyle(
                    color: Ktextcolor,
                    fontSize: 40,
                    fontFamily: GoogleFonts
                        .roboto()
                        .fontFamily,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Please enter your email adress to request a password reset',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontFamily: GoogleFonts
                        .roboto()
                        .fontFamily,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                cursorColor: KPrimarycolor,
                onTap: () {},

                decoration: InputDecoration(
                  suffixIconColor: Klighttextcolor,
                  contentPadding:
                 const  EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  suffixIcon:
                    const  Icon(
                      Icons.email ,
                      size: 24,
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
                      gapPadding: 14,
                      borderSide: const BorderSide(color: Ktextcolor)),
                  focusColor: KPrimarycolor,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      gapPadding: 14,
                      borderSide: const BorderSide(
                        color: KPrimarycolor,
                        width: 2,
                      )),
                ),
              ),
              const SizedBox(
                height: 50,
              ),
               const Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 40.0,vertical: 0),
                 child: default_button(text: 'reset my password', x: 1.5, y: 13, button_color: KPrimarycolor),
               ),
              const SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
    );
  }
}

