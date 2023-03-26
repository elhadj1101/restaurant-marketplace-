import 'package:flutter/material.dart';
import 'package:restaurant_marketplace_h/constants.dart';

class ressetpassword extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        body: Stack(
          children: [
            SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 180,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 26, right: 53),
                      child: Text(
                        "Resset Password",
                        style: TextStyle(
                            fontSize: 36.41,
                            fontWeight: FontWeight.w600,
                            fontFamily: "sofiapro"),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 26, right: 113),
                      child: Text(
                        "Please enter your email address to \nrequest a password reset",
                        style: TextStyle(
                            fontFamily: "sofiapro",
                            fontWeight: FontWeight.w400,
                            fontSize: 14),
                      ),
                    ),
                    const SizedBox(
                      height: 38,
                    ),
                    SizedBox(
                      height: 65,
                      width: 330,
                      child: TextField(
                        style: const TextStyle(
                          color: Color(0xFF111719),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: KPrimarycolor, width: 1)),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: const BorderSide(
                                color: KPrimarycolor, width: 1),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 51,
                    ),
                    sendbutton("Send new password"),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
// send button 
class sendbutton extends StatelessWidget {
  final String text;
  const sendbutton(
    this.text, {super.key}
  );
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
            backgroundColor: KPrimarycolor,
            foregroundColor: Colors.white,
            minimumSize: const Size(248, 60),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)))),
        child: Text(text));
  }
}
