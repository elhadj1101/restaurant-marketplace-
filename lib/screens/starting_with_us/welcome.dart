import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/Auth.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/signUP/sign_up.dart';
import '../../Providers/restaurant_items_provider.dart';
import '../../Providers/userProvider.dart';
import '../main_app/drawer/Add_new_adress.dart';
import 'login/Login_page.dart';

class welcome extends StatefulWidget {
  const welcome({super.key});

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  void initState() {
    super.initState();
    // Call your function here
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
        final userProvider = Provider.of<UserProvider>(context, listen: false);
        final DocumentReference userDoc = FirebaseFirestore.instance
            .collection('users')
            .doc(userCredential.user!.uid);
        bool exist = false;
        try {
          DocumentSnapshot documentSnapshot = await userDoc.get();
          exist = documentSnapshot.exists;
        } catch (e) {
          print(e);
          exist = false;
        }
        if (exist) {
          final itemProvider =
            Provider.of<ItemsProvider>(context,listen: false);
          itemProvider.getPromos();
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Auth(),
          ));
        } else {
          userProvider.setInitialData(userCredential.user!.displayName ?? "",
              userCredential.user!.email ?? "", "");
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => Add_new_adress(),
          ));
        }
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
    return Scaffold(
      body: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(KPrimarycolor),
                ),
              );
            } else {
              return Stack(
                children: [
                  Container(
                    height: double.infinity,
                    width: double.infinity,
                    child: Image.asset(
                      "assets/images/realwelcome.png",
                      fit: BoxFit.fitWidth,
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
                        padding: EdgeInsets.fromLTRB(20.w, 160.h, 64.w, 19.h),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              text: "Welcome to ",
                              style: TextStyle(
                                  fontFamily: "sofiapro",
                                  color: Ktextcolor,
                                  fontWeight: FontWeight.w700,
                                  fontSize: 45.sp)),
                          TextSpan(
                              text: "\nTabaki",
                              style: TextStyle(
                                  fontFamily: "sofiapro",
                                  fontSize: 53.sp,
                                  fontWeight: FontWeight.w700,
                                  color: KPrimarycolor)),
                        ])),
                      ),
                      SizedBox(
                        height: 19.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Text(
                          "Explore Local Restaurants Gems \nOn Tabaki.",
                          style: TextStyle(
                              color: Color(0xFF30384F),
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: 200.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          // column of under sign up with
                          children: [
                            Row(children: <Widget>[
                              Expanded(
                                  child: Divider(
                                indent: 44.w,
                                color: const Color(0xFFFFFFFF),
                                endIndent: 17.w,
                              )),
                              const Text(
                                " sign in with ",
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFFFFFF),
                                ),
                              ),
                              Expanded(
                                  child: Divider(
                                endIndent: 38.w,
                                color: const Color(0xFFFFFFFF),
                                indent: 17.w,
                              )),
                            ]),
                            SizedBox(
                              height: 18.h,
                            ),
                            Row(
                              // Row of facebook and google button
                              children: [
                                SizedBox(
                                  width: 30.w,
                                ),
                                ElevatedButton(
                                    onPressed: () {
                                      signInWithGoogle();
                                    },
                                    style: Primarybuttonstyle,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 92.w),
                                      child: Row(
                                        // Row of Google logo and text google
                                        children: [
                                          Image.asset(
                                              "assets/images/google.png"),
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
                              height: 18.h,
                            ),
                            const register(),
                            SizedBox(
                              height: 30.h,
                            ),
                            // Row of already have an account and sign in button
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already have an account? ",
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                                SizedBox(
                                  width: 5.w,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context)
                                        .push(MaterialPageRoute(
                                      builder: (context) => Login_page(),
                                    ));
                                  },
                                  child: Text(
                                    "Sign In",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.w500,
                                        color: Colors.white,
                                        decoration: TextDecoration.underline),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  )
                ],
              );
            }
          }),
    );
  }
}

class register extends StatelessWidget {
  const register({super.key});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => const Signup_page(),
        ));
      },
      style: ElevatedButton.styleFrom(
        minimumSize: Size(315.w, 54.h),
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.white, width: 2.w),
          borderRadius: const BorderRadius.all(Radius.circular(30)),
        ),
        backgroundColor: Colors.grey.withOpacity(0.45),
      ),
      child: const Text("Register Now !"),
    );
  }
}
