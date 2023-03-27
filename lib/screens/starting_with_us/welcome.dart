import 'package:flutter/material.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/email_or_phone_page.dart';
import 'login/Login_page.dart';

class welcome extends StatelessWidget {
  const welcome({super.key});

  @override
  Widget build(BuildContext context) {
    print("hello world");
    return Scaffold(
      body: Stack(
        children: [
           Container(

            height: double.infinity,
            child: Image.asset(
              "assets/images/realwelcome.png",
              fit: BoxFit.cover,
            ),
          ),
          Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Color(0xFF191B2F)])),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(20, 160, 64, 19),
                child: RichText(
                    text: const TextSpan(children: [
                  TextSpan(
                      text: "Welcome to ",
                      style: TextStyle(
                          fontFamily: "sofiapro",
                          color: Ktextcolor,
                          fontWeight: FontWeight.w700,
                          fontSize: 45)),
                  TextSpan(
                      text: "\nTabaki",
                      style: TextStyle(
                          fontFamily: "sofiapro",
                          fontSize: 53,
                          fontWeight: FontWeight.w700,
                          color: KPrimarycolor)),
                ])),
              ),
              const SizedBox(
                height: 19,
              ),
              const Padding(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Your favourite foods delivered \nfast at your door.",
                  style: TextStyle(
                      color: Color(0xFF30384F),
                      fontSize: 18,
                      fontWeight: FontWeight.w400),
                ),
              ),
              const SizedBox(
                height: 213,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                // column of under sign up with
                children: [
                  Row(children: const <Widget>[
                    Expanded(
                        child: Divider(
                      indent: 44,
                      color: Color(0xFFFFFFFF),
                      endIndent: 17,
                    )),
                    Text(
                      " sign up with ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFFFFFFFF),
                      ),
                    ),
                    Expanded(
                        child: Divider(
                      endIndent: 38,
                      color: Color(0xFFFFFFFF),
                      indent: 17,
                    )),
                  ]),
                  const SizedBox(
                    height: 18,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // Row of facebook and google button
                    children: const [
                       facebookbutton(),
                       SizedBox(
                        width: 30,
                      ),
                      googlebutton()
                    ],
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  const email_or_phonebutton(),
                  const SizedBox(
                    height: 30,
                  ),
                  // Row of already have an account and sign in button
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Already have an account? ",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      GestureDetector(
                        onTap:() {
                          Navigator.of(context).push(MaterialPageRoute(builder:(context) => Login_page(),));
                        },
                        child: const Text(
                          "Sign In",
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: Colors.white,
                              decoration: TextDecoration.underline),
                        ),
                      )
                    ],
                  ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
// google button
class googlebutton extends StatelessWidget {
  const googlebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {},
        style: Primarybuttonstyle,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            // Row of Google logo and text google
            children: [
              Image.asset("assets/images/google.png"),
              const SizedBox(
                width: 10,
              ),
              const Text(
                "GOOGLE",
                style: welcometextstyle,
              ),
            ],
          ),
        ));
  }
}
//facebook button
class facebookbutton extends StatelessWidget {
  const facebookbutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton.icon(
      onPressed: () {},
      icon: const Icon(
        Icons.facebook,
        color: Color(0xFF1877F2),
        size: 35,
      ),
      label: const Text(
        "FACEBOOK",
        style: welcometextstyle,
      ),
      style: Primarybuttonstyle,
    );
  }
}
class email_or_phonebutton extends StatelessWidget {
  const email_or_phonebutton({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(builder:(context) => Email_or_phone(),));
      },
      style: ElevatedButton.styleFrom(
        minimumSize: const Size(315, 54),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: Colors.white),
          borderRadius: BorderRadius.all(Radius.circular(30)),
        ),
        backgroundColor: Colors.grey.withOpacity(0.45),
      ),
      child: const Text("Start with email or phone"),
    );
  }
}



