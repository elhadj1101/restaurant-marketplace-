import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/Home_screen.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/login/userInfos.dart';
import 'package:restaurant_marketplace_h/splash_screen_timer.dart';
import 'package:firebase_core/firebase_core.dart';
class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          String? userName=snapshot.data?.displayName;
          String? userEmail=snapshot.data?.email;
          UserInfos newUser = UserInfos(username:userName, useremail: userEmail);
          return Home_screen();
        } else {
          return splash_screen();
        }
      }),
    ));
  }
}
