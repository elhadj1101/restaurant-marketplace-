import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
class Verification_Code_page_contents extends StatelessWidget {
  const Verification_Code_page_contents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int i = 1;
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
                'Verification Code ',
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
                'Please type the verification code sent to  useradress@gmail.com ',
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
              Form(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Otp_form(i: 1),
                      Otp_form(i: 2),
                      Otp_form(i: 3),
                      Otp_form(i: 4),
                    ],
                  )),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: MediaQuery
                        .of(context)
                        .size
                        .width / 12),
                child: Row(
                  children: [
                    Text('I don\'t receive a code !',
                        style: TextStyle(
                          fontSize: 16,
                          color: Ktextcolor,
                          fontFamily: GoogleFonts
                              .roboto()
                              .fontFamily,
                        )),
                    GestureDetector(

                      child: Text(' Please Resend',
                          style: TextStyle(
                            fontSize: 16,
                            color: KPrimarycolor,
                            fontFamily: GoogleFonts
                                .roboto()
                                .fontFamily,
                          )),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Otp_form extends StatelessWidget {
  const Otp_form({Key? key, required this.i}) : super(key: key);
  final int i;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 75,
      width: 68,
      child: TextField(

        onChanged: (value) {
          if (i != 4) {
            if (value.length == 1) {
              FocusScope.of(context).nextFocus();
            }
          }
          if (i !=1) {
            if (value.length == 0) {
              FocusScope.of(context).previousFocus();
            }

          }
        },
        textAlignVertical: TextAlignVertical.center,
        cursorColor: KPrimarycolor,
        style: Theme
            .of(context)
            .textTheme
            .headlineMedium,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        decoration: InputDecoration(

          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              color: Colors.black38,
              width: 2,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: const BorderSide(
              width: 2,
              color: KPrimarycolor,
            ),
          ),
        ),
      ),
    );
  }
}
