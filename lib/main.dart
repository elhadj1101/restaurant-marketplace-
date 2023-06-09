import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/Auth.dart';
import 'package:restaurant_marketplace_h/Providers/restaurant_items_provider.dart';
import 'package:restaurant_marketplace_h/Providers/restaurant_provider.dart';
import 'package:restaurant_marketplace_h/Providers/userProvider.dart';

import 'package:restaurant_marketplace_h/screens/main_app/Rating_page.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/food_details.dart';
import 'package:restaurant_marketplace_h/screens/main_app/drawer/Add_new_adress.dart';
import 'package:restaurant_marketplace_h/screens/main_app/drawer/sidemenu.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/Home_screen.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/home.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/item_card.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/restaurand_card.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:restaurant_marketplace_h/screens/main_app/order/my_orders.dart';

import 'Providers/category_provider.dart';
import 'Providers/orders_provider.dart';
import 'Providers/reviews_Provider.dart';
import 'firebase_options.dart';

import 'screens/main_app/favorites/button_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
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
        builder: (context, child) {
          return MultiProvider(
            providers: [
              ChangeNotifierProvider<Provider_Drawer>(
                  create: (context) => Provider_Drawer()),
              ChangeNotifierProvider<Provider_home>(
                  create: (context) => Provider_home()),
              ChangeNotifierProvider<Provider_Category>(
                  create: (context) => Provider_Category()),
              ChangeNotifierProvider<Provider_favorite>(
                  create: (context) => Provider_favorite()),
              ChangeNotifierProvider<Provider_favorite_item>(
                  create: (context) => Provider_favorite_item()),
              ChangeNotifierProvider<Provider_dropdown>(
                  create: (context) => Provider_dropdown()),
              ChangeNotifierProvider<Provider_scroll>(
                  create: (context) => Provider_scroll()),
              ChangeNotifierProvider<Provider_adress>(
                  create: (context) => Provider_adress()),
              ChangeNotifierProvider<Provider_rating>(
                  create: (context) => Provider_rating()),
              ChangeNotifierProvider<UserProvider>(
                  create: (context) => UserProvider()),
              ChangeNotifierProvider<Provider_numberofitems>(
                  create: (context) => Provider_numberofitems()),

              ChangeNotifierProvider<RestaurantProvider>(
                  create: (context) => RestaurantProvider()),
                  ChangeNotifierProvider<OrdersProvider>(
                  create: (context) => OrdersProvider()),
              ChangeNotifierProvider<ItemsProvider>(
                  create: (context) => ItemsProvider()),
              ChangeNotifierProvider<buttonState>(create: (context) => buttonState()),
              ChangeNotifierProvider<CategoryProvider>(
                  create: (context) => CategoryProvider()),

              ChangeNotifierProvider<reviewsprovider>(
                  create: (context) => reviewsprovider()),
            ],
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                splashColor: Colors.transparent,
                highlightColor: Colors.transparent,
                fontFamily: GoogleFonts.poppins().fontFamily,
                textTheme: GoogleFonts.poppinsTextTheme(),
              ),
              home:  Auth(),
                  // splash_screen(),
                  // const  Home_screen(),
                  // Category_page() ,
                  //Add_new_adress(),
                  //  Rating_page(),
            //   Food_details(DOCID: "B142OqxQqEPWY5gQajWf",),
              //reviews_page() ,
              // const Add_to_cart(),
            ),

            //  const Home_screen(),
            // theme: ThemeData(
            //   splashColor: Colors.transparent,
            //   highlightColor: Colors.transparent,
            //   fontFamily: GoogleFonts.poppins().fontFamily,
            //   textTheme: GoogleFonts.poppinsTextTheme(),
          );
          // ),
        });
  }
}
