import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/Home_screen.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/login/Login_page.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/welcome.dart';
import 'package:restaurant_marketplace_h/splash_screen_timer.dart';

class Auth extends StatelessWidget {
  const Auth({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          return Home_screen();
        } else {
          return splash_screen();
        }
      }),
    ));
  }
}
