import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/Home_screen.dart';
import 'package:restaurant_marketplace_h/splash_screen_timer.dart';
import 'package:firebase_core/firebase_core.dart';

import 'Providers/restaurant_items_provider.dart';
import 'Providers/userProvider.dart';

class Auth extends StatefulWidget {
  const Auth({super.key});

  @override
  State<Auth> createState() => _AuthState();
}

class _AuthState extends State<Auth> {
  
  Future getUser() async {
    final userProvider = Provider.of<UserProvider>(context, listen: false);
   await userProvider.getUserData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: ((context, snapshot) {
        if (snapshot.hasData) {
          
          getUser();
          return Home_screen();
        } else {
          return splash_screen();
        }
      }),
    ));
  }
}
