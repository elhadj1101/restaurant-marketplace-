import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/main_app/drawer/sidemenu.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/Home_screen.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/home.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/verivication_code_page/verification_code_page.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/welcome.dart';
import 'package:restaurant_marketplace_h/splash_screen_timer.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';


Future <void> main() async{
  WidgetsFlutterBinding.ensureInitialized();
await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform
);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return ScreenUtilInit(
        designSize: const Size(392.72, 826.90),
        minTextAdapt: true,
        splitScreenMode: true,
      builder : (context , child )  {
        return  MultiProvider(
          providers: [
            ChangeNotifierProvider<Provider_Drawer>(create: (context) => Provider_Drawer()),
            ChangeNotifierProvider<Provider_home>(create: (context) => Provider_home()),

          ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            home:  splash_screen(),
            //  const Home_screen(),
            // theme: ThemeData(
            //   splashColor: Colors.transparent,
            //   highlightColor: Colors.transparent,
            //   fontFamily: GoogleFonts.poppins().fontFamily,
            //   textTheme: GoogleFonts.poppinsTextTheme(),

            ),
      // ),
    );



      }
    ) ;



  }
}
