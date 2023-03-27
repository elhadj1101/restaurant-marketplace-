import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../constants.dart';
import '../../../widgets/default_button.dart';
import '../Reset_pass_page/reset_password_page.dart';

class Login_page_contents extends StatefulWidget {
  const Login_page_contents({Key? key}) : super(key: key);

  @override
  State<Login_page_contents> createState() => _Login_page_contentsState();
}

class _Login_page_contentsState extends State<Login_page_contents> {
  bool isvisible = true;

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
                height: 40,
              ),
              Text(
                'Log in',
                style: TextStyle(
                    color: Ktextcolor,
                    fontSize: 40,
                    fontFamily: GoogleFonts.roboto().fontFamily,
                    fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 70,
              ),
              TextFormField(
                cursorColor: KPrimarycolor,
                onTap: () {},
                decoration: InputDecoration(
                  suffixIconColor: Klighttextcolor,
                  contentPadding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  suffixIcon: const Icon(
                    Icons.email,
                  ),
                  hintStyle: const TextStyle(
                    color: Kverylighttextcolor,
                  ),
                  labelText: 'Email',
                  labelStyle: const TextStyle(
                    color: Klighttextcolor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14,
                      borderSide: const BorderSide(color: Ktextcolor)),
                  focusColor: KPrimarycolor,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14,
                      borderSide: const BorderSide(
                        color: KPrimarycolor,
                        width: 2,
                      )),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              TextFormField(
                cursorColor: KPrimarycolor,
                onTap: () {},
                obscureText: !isvisible,
                decoration: InputDecoration(
                  suffixIconColor: Klighttextcolor,
                  contentPadding:
                      EdgeInsets.symmetric(horizontal: 25, vertical: 20),
                  suffixIcon: IconButton(
                    icon: Icon(
                      isvisible ? Icons.visibility : Icons.visibility_off,
                      size: 24,
                    ),
                    onPressed: () {
                      setState(() {
                        isvisible = !isvisible;
                      });
                    },
                  ),
                  hintStyle: const TextStyle(
                    color: Kverylighttextcolor,
                  ),
                  labelText: 'Password',
                  labelStyle: const TextStyle(
                    color: Klighttextcolor,
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14,
                      borderSide: const BorderSide(color: Ktextcolor)),
                  focusColor: KPrimarycolor,
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      gapPadding: 14,
                      borderSide: const BorderSide(
                        color: KPrimarycolor,
                        width: 2,
                      )),
                ),
              ),
              const SizedBox(
                height: 60,
              ),
               const Padding(

                 padding:  EdgeInsets.symmetric(horizontal: 40.0,vertical: 0),
                 child: default_button(
                    text: 'Sign up', x: 1.5, y: 13, button_color: KPrimarycolor),
               ),              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: 10 * MediaQuery.of(context).size.width / 38),
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(builder:(context) => reset_password_page(),));

                  },
                  child: const Text(
                    'Forgot password ? ',
                    style: TextStyle(
                        fontSize: 15,
                        color: KPrimarycolor,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: const BoxDecoration(
                      color: Kverylighttextcolor,
                      gradient: LinearGradient(
                        colors: [Kverylighttextcolor, KLightcolor],
                      ),
                    ),
                  ),
                  const Text(
                    '   Sign in with    ',
                    style: TextStyle(
                        color: Klighttextcolor,
                        fontWeight: FontWeight.w400,
                        fontSize: 15),
                  ),
                  Container(
                    height: 2,
                    width: MediaQuery.of(context).size.width / 4,
                    decoration: const BoxDecoration(
                      color: Kverylighttextcolor,
                      gradient: LinearGradient(
                        colors: [KLightcolor, Kverylighttextcolor],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton.icon(
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
                  ),
                  ElevatedButton(
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
                      ))
                ],

              ),
              const SizedBox(
                height: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}
