import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/Home_screen.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/widgets/default_button.dart';
import '../../../Providers/restaurant_items_provider.dart';
import '../../../constants.dart';
import '../../../Providers/userProvider.dart';
import '../Reset_pass_page/reset_password_page.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Login_page_contents extends StatefulWidget {
  const Login_page_contents({Key? key}) : super(key: key);

  @override
  State<Login_page_contents> createState() => _Login_page_contentsState();
}

class _Login_page_contentsState extends State<Login_page_contents> {
  bool isvisible = true;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void goHome() {
            final itemProvider = Provider.of<ItemsProvider>(context ,listen: false);
     itemProvider.getPromos();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Home_screen(),
    ));
  }

  Future signIn() async {
    print("dkhel");
    try {
      final UserCredential userCredential = await FirebaseAuth.instance
          .signInWithEmailAndPassword(
              email: _emailController.text.trim(),
              password: _passwordController.text.trim());
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      await userProvider.getUserData();
      if (userProvider.isLogged) {
        goHome();
      }
    } catch (e) {
      // Handle sign-in errors here

      String error = 'error';
      if (e is FirebaseAuthException) {
        error = 'email or password incorrect' ;
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          clipBehavior: Clip.none,
          backgroundColor: Colors.red,
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
      throw error;
    }
  }

  Future signInWithGoogle() async {
    final GoogleSignIn googleSignIn = GoogleSignIn();
    final GoogleSignInAccount? googleSignInAccount =
        await googleSignIn.signIn();

    if (googleSignInAccount != null) {
      final GoogleSignInAuthentication googleAuth =
          await googleSignInAccount.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      try {
        final UserCredential userCredential =
            await FirebaseAuth.instance.signInWithCredential(credential);

        final User? user = userCredential.user;
        goHome();
      } catch (error) {
        print('Error signing in with Google: $error');
        return null;
      }
    } else {
      print('Google sign-in aborted');
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(KPrimarycolor),
                ),
              );
            } else {
              return Padding(
                padding: EdgeInsets.fromLTRB(30.w, 30.h, 30.w, 0.h),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 40.h,
                      ),
                      Text(
                        'Log in',
                        style: TextStyle(
                            color: Ktextcolor,
                            fontSize: 40.sp,
                            fontFamily: GoogleFonts.roboto().fontFamily,
                            fontWeight: FontWeight.w700),
                      ),
                      SizedBox(
                        height: 70.h,
                      ),
                      TextFormField(
                        controller: _emailController,
                        cursorColor: KPrimarycolor,
                        onTap: () {},
                        decoration: InputDecoration(
                          suffixIconColor: Klighttextcolor,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 20.h),
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
                        height: 40.h,
                      ),
                      TextFormField(
                        controller: _passwordController,
                        cursorColor: KPrimarycolor,
                        onTap: () {},
                        obscureText: !isvisible,
                        decoration: InputDecoration(
                          suffixIconColor: Klighttextcolor,
                          contentPadding: EdgeInsets.symmetric(
                              horizontal: 25.w, vertical: 20.h),
                          suffixIcon: IconButton(
                            icon: Icon(
                              isvisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
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
                        height: 60.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          default_button(
                              text: 'Sign In ',
                              x: 2,
                              y: 13,
                              button_color: KPrimarycolor,
                              function: signIn),
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Center(
                        child: GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => reset_password_page(),
                            ));
                          },
                          child: Text(
                            'Forgot password ? ',
                            style: TextStyle(
                                fontSize: 15.sp,
                                color: KPrimarycolor,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 2.h,
                            width: MediaQuery.of(context).size.width / 4,
                            decoration: const BoxDecoration(
                              color: Kverylighttextcolor,
                              gradient: LinearGradient(
                                colors: [Kverylighttextcolor, KLightcolor],
                              ),
                            ),
                          ),
                          Text(
                            '   Sign in with    ',
                            style: TextStyle(
                                color: Klighttextcolor,
                                fontWeight: FontWeight.w400,
                                fontSize: 15.sp),
                          ),
                          Container(
                            height: 2.h,
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
                      SizedBox(
                        height: 40.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ElevatedButton(
                              onPressed: () {
                                signInWithGoogle();
                              },
                              style: Primarybuttonstyle,
                              child: Padding(
                                padding: EdgeInsets.symmetric(horizontal: 92.w),
                                child: Row(
                                  // Row of Google logo and text google
                                  children: [
                                    Image.asset("assets/images/google.png"),
                                    SizedBox(
                                      width: 10.w,
                                    ),
                                    Text(
                                      " GOOGLE",
                                      style: welcometextstyle,
                                    ),
                                  ],
                                ),
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 40.h,
                      )
                    ],
                  ),
                ),
              );
            }
          }),
    );
  }
}
