import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/Phone_reg_page/phone_reg_page.dart';
import 'package:restaurant_marketplace_h/screens/Phone_reg_page/phoneregistration.dart';
import 'package:restaurant_marketplace_h/screens/signUP/sign_up.dart';
import 'welcome.dart';

class Email_or_phone extends StatelessWidget {
  const Email_or_phone({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KPrimarycolor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder:(context) => const Signup_page(),));

              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(315, 54),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                backgroundColor: Colors.grey.withOpacity(0.45),
              ),
              child: const Text("start with email",style: TextStyle(fontSize: 20),),
            ),
            const SizedBox(
              height: 30,
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder:(context) => phone_reg_page(),));

              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(315, 54),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(color: Colors.white),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                ),
                backgroundColor: Colors.grey.withOpacity(0.45),
              ),
              child: const Text("start with phone",style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),
    );
  }
}
