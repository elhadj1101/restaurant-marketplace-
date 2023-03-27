import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:restaurant_marketplace_h/widgets/default_button.dart';

import '../../../constants.dart';

class phoneregistration extends StatelessWidget {
  const phoneregistration({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = 0 ;

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
                'Phone registration ',
                style: TextStyle(
                    color: Ktextcolor,
                    fontSize: 37,
                    fontFamily: GoogleFonts
                        .roboto()
                        .fontFamily,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                'Enter your phone number to sign up with us ',
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
              IntlPhoneField(

                showCountryFlag: true,
                showDropdownIcon: true ,
                initialCountryCode: 'DZ' ,
                cursorColor: KPrimarycolor,
                disableLengthCheck: true,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(9),
                ],

                decoration: InputDecoration(


                  hintStyle: const TextStyle(
                    color: Kverylighttextcolor,
                  ),
                  labelText: 'phone number',
                  labelStyle: const TextStyle(
                    color: Klighttextcolor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: Ktextcolor)),
                  focusColor: KPrimarycolor,
                  focusedBorder: OutlineInputBorder(
                      gapPadding: 10,
                      borderRadius: BorderRadius.circular(11),
                      borderSide: const BorderSide(color: KPrimarycolor, width: 2,)
                  ),
                ),

              ),
              const SizedBox(
                height: 50,
              ),
              const Padding(
                padding:  EdgeInsets.symmetric(horizontal: 40.0,vertical: 0),
                child: default_button(text: 'Sign up', x: 1.5, y: 13, button_color: KPrimarycolor),
              ),
              const SizedBox(
                height: 20,
              ),

            ],
          ),
        ),
      ),
    );
  }
}

