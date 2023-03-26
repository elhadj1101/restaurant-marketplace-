import 'package:flutter/material.dart';
import 'package:restaurant_marketplace_h/constants.dart';



class phoneregistration extends StatelessWidget {
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
                      padding: EdgeInsets.only(left: 26, right: 60),
                      child: SizedBox(
                        height: 40,
                        width: 296,
                        child: Text(
                          "Registration",
                          style: TextStyle(
                              fontSize: 36.41,
                              fontWeight: FontWeight.w600,
                              fontFamily: "sofiapro"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 26, right: 113),
                      child: Text(
                        "Enter your phone number to verify \nyour account",
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
                        maxLength: 9,
                        style: const TextStyle(
                          color: Color(0xFF111719),
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          prefix: Row(
                            children: const [Text("(+213) ")],
                          ),
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
                    sendbutton("SEND")
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
