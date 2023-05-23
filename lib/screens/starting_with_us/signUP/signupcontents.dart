import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/Auth.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/Home_screen.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/signUP/AddUser2Store.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../../../Providers/userProvider.dart';
import '../../main_app/drawer/Add_new_adress.dart';
import '../login/Login_page.dart';
import '../widgets/default_button.dart';

class Sign_up_content extends StatefulWidget {
  const Sign_up_content({Key? key}) : super(key: key);

  @override
  State<Sign_up_content> createState() => _Sign_up_contentState();
}

class _Sign_up_contentState extends State<Sign_up_content> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  bool isvisible = false;
  bool isvisible2 = false;
  bool istaped = false;
  final _fullNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _passwordController2 = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  goToAdrress() {
    String _email = _emailController.text.trim();
    String _fullName = _fullNameController.text.trim();
    String _password = _passwordController.text.trim();

    final userProvider = Provider.of<UserProvider>(context, listen: false);
    userProvider.setInitialData(_fullName, _email, _password);
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => Add_new_adress(),
    ));
  }

  Future signUp() async {
    try {
      String _email = _emailController.text.trim();
      String _fullName = _fullNameController.text.trim();
      // String _number = _numberController.text.trim();
      String _password = _passwordController.text.trim();

      final UserCredential userCredential =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: _email,
        password: _password,
      );
      String uid = userCredential.user!.uid;
      // AddUser(_fullName, _email, _number, uid).addUser();

      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Auth(),
      ));
    } catch (e) {
      String error = 'error';
      if (e is FirebaseAuthException) {
        if (e.code.contains('email-already-in-use')) {
          error = 'this email is alreay used ';
        } else {
          error = 'error';
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          clipBehavior: Clip.none,
          margin: EdgeInsets.symmetric(
              horizontal: (error.length < 20) ? 40.w : 10.w, vertical: 20.h),
          content: Center(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                '${error}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ))));
      // Handle the exception here

      // You can also throw the error to the calling code if needed
      throw e;
    }
  }

  void finalsignup() {
    if (formKey.currentState!.validate()) {
      if (_passwordController2.text == _passwordController.text) {
        goToAdrress();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.fromLTRB(30.w, 25.h, 30.w, 0.h),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Sign up',
                  style: TextStyle(
                      color: Ktextcolor,
                      fontSize: 40.sp,
                      fontFamily: GoogleFonts.roboto().fontFamily,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  controller: _fullNameController,
                  cursorColor: KPrimarycolor,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[a-zA-Z \s]+$').hasMatch(value)) {
                      return 'enter valid name';
                    } else {
                      return null;
                    }
                  },
                  decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.w,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.w,
                        )),
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    suffixIconColor: Klighttextcolor,
                    suffixIcon: const Icon(
                      Icons.person,
                    ),
                    hintStyle: const TextStyle(
                      color: Kverylighttextcolor,
                    ),
                    labelText: 'Full name ',
                    labelStyle: const TextStyle(
                      color: Klighttextcolor,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: const BorderSide(color: Ktextcolor)),
                    focusColor: KPrimarycolor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: KPrimarycolor,
                          width: 2.w,
                        )),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  controller: _emailController,
                  cursorColor: KPrimarycolor,
                  validator: (value) {
                    if (value!.isEmpty ||
                        !RegExp(r'^[\w-]+(\.[\w-]+)*@([a-zA-Z0-9-]+\.)+[a-zA-Z]{2,7}$')
                            .hasMatch(value)) {
                      return 'enter valid email';
                    } else {
                      return null;
                    }
                  },
                  onTap: () {},
                  decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.w,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.w,
                        )),
                    suffixIconColor: Klighttextcolor,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
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
                        gapPadding: 14.w,
                        borderSide: const BorderSide(color: Ktextcolor)),
                    focusColor: KPrimarycolor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: KPrimarycolor,
                          width: 2.w,
                        )),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  validator: (value) {
                    if (value!.isEmpty || (value!.length < 6)) {
                      return 'enter valid password';
                    } else {
                      return null;
                    }
                  },
                  controller: _passwordController,
                  cursorColor: KPrimarycolor,
                  onTap: () {},
                  obscureText: !isvisible,
                  decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.w,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.w,
                        )),
                    suffixIconColor: Klighttextcolor,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isvisible ? Icons.visibility : Icons.visibility_off,
                        size: 24.r,
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
                        gapPadding: 14.w,
                        borderSide: const BorderSide(color: Ktextcolor)),
                    focusColor: KPrimarycolor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: KPrimarycolor,
                          width: 2.w,
                        )),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                TextFormField(
                  cursorColor: KPrimarycolor,
                  validator: (value) {
                    if (value!.isEmpty ||
                        RegExp(r'^[a-z A-Z]+$').hasMatch(value) ||
                        (_passwordController2.text !=
                            _passwordController.text)) {
                      if ((_passwordController2.text !=
                              _passwordController.text) &&
                          !value!.isEmpty) {
                        return 'passwords don\'t match ';
                      } else if (value!.isEmpty ||
                          RegExp(r'^[a-z A-Z]+$').hasMatch(value)) {
                        return 'enter valid Password';
                      }
                    } else {
                      return null;
                    }
                  },
                  onTap: () {},
                  obscureText: !isvisible2,
                  controller: _passwordController2,
                  decoration: InputDecoration(
                    focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.w,
                        )),
                    errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: Colors.red,
                          width: 2.w,
                        )),
                    suffixIconColor: Klighttextcolor,
                    contentPadding:
                        EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    suffixIcon: IconButton(
                      icon: Icon(
                        isvisible2 ? Icons.visibility : Icons.visibility_off,
                        size: 24.r,
                      ),
                      onPressed: () {
                        setState(() {
                          isvisible2 = !isvisible2;
                        });
                      },
                    ),
                    hintStyle: const TextStyle(
                      color: Kverylighttextcolor,
                    ),
                    labelText: 'Confirm your Password',
                    labelStyle: const TextStyle(
                      color: Klighttextcolor,
                    ),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: const BorderSide(color: Ktextcolor)),
                    focusColor: KPrimarycolor,
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        gapPadding: 14.w,
                        borderSide: BorderSide(
                          color: KPrimarycolor,
                          width: 2.w,
                        )),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    default_button(
                        text: 'Next ',
                        x: 2,
                        y: 13,
                        button_color: KPrimarycolor,
                        function: finalsignup),
                  ],
                ),
                SizedBox(
                  height: 40.h,
                ),
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 120),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('already have an account ? ',
                          style: TextStyle(
                            fontSize: 13.sp,
                            color: Ktextcolor,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                          )),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Login_page(),
                          ));
                        },
                        child: Text(' Sign in',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: KPrimarycolor,
                              fontFamily: GoogleFonts.roboto().fontFamily,
                            )),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
