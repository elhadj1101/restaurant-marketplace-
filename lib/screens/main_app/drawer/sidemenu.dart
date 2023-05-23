import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/Auth.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/main_app/drawer/working_on_page.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/Home_screen.dart';

import '../../../Providers/userProvider.dart';
import '../profile /profile.dart';
import 'Add_new_adress.dart';

class Sidemenu extends StatefulWidget {
  const Sidemenu({Key? key}) : super(key: key);

  @override
  State<Sidemenu> createState() => _SidemenuState();
}

class _SidemenuState extends State<Sidemenu> {
  Future<void> _signOut() async {
    Provider.of<Provider_home>(context, listen: false).is_side_menu_opened =
        false;
    await FirebaseAuth.instance.signOut();
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Auth(),
    ));
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final username = userProvider.username;
    final email = userProvider.email;
    final image = userProvider.image;
    return Scaffold(
      backgroundColor: KLightcolor,
      body: Container(
        width: 280.w,
        height: double.infinity,
        child: SafeArea(
          child: Consumer<Provider_Drawer>(
            builder: (context, Provider_Drawer, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Info_card(
                      name: username,
                      email: email,
                      image: image,
                      ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const Listoftiles(),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: EdgeInsets.fromLTRB(22.0.w, 0.h, 122.w, 0.h),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.symmetric(
                                horizontal: 10.w, vertical: 12.h),
                            shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30))),
                            elevation: 5,
                            backgroundColor: KPrimarycolor),
                        onPressed: () {
                          _signOut();

                        },
                        child: Row(
                          children: [
                            Container(
                              height: 30.h,
                              width: 30.w,
                              decoration: const BoxDecoration(
                                  shape: BoxShape.circle, color: Colors.white),
                              child: const Icon(
                                Icons.power_settings_new,
                                color: KPrimarycolor,
                              ),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              'Log Out',
                              style: TextStyle(fontSize: 17.sp),
                            ),
                          ],
                        )),
                  ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}

class Info_card extends StatelessWidget {
  const Info_card(
      {Key? key,
      required this.name,
      required this.email,
      required this.image,
  })
      : super(key: key);
  final String name;

  final String email;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(26.0.w, 36.h, 0.w, 10.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(shape: BoxShape.circle, boxShadow: [
              BoxShadow(
                  color: KLightcolor,
                  blurRadius: 20.r,
                  spreadRadius: 20.r,
                  offset: Offset(0.w, 5.h))
            ]),
            child: CircleAvatar(
              radius: 50.r,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child:  (image=="")
                      ? Image.asset('assets/images/default_avatar.png')
                      : Image.network(image,fit: BoxFit.cover)),
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            name,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(
            height: 5.h,
          ),
          Text(
            email,
            style: TextStyle(fontSize: 15.sp, color: Klighttextcolor),
          ),
        ],
      ),
    );
  }
}

class Listoftiles extends StatelessWidget {
  const Listoftiles({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8.0.r),
        child: Column(
          children: [
            Listtilemodified(
                tilenumber: 1,
                myicon: Icons.my_library_books,
                mytext: 'My Orders',
                myiconsize: 25.r),
            GestureDetector(
              onTap: () => Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => const profile()),),
              child: Listtilemodified(
                  tilenumber: 2,
                  myicon: Icons.person,
                  mytext: 'My Profile',
                  myiconsize: 27.r),
            ),
          
            Listtilemodified(
                tilenumber: 4,
                myicon: Icons.wallet,
                mytext: 'Payments Methods',
                myiconsize: 25.r),
            Listtilemodified(
                tilenumber: 5,
                myicon: Icons.email,
                mytext: 'Contact Us',
                myiconsize: 25.r),
            Listtilemodified(
                tilenumber: 6,
                myicon: Icons.settings,
                mytext: 'Settings',
                myiconsize: 25.r),
            Listtilemodified(
                tilenumber: 7,
                myicon: Icons.help,
                mytext: 'Helps & FAQs',
                myiconsize: 25.r),
          ],
        ));
  }
}

class Provider_Drawer extends ChangeNotifier {
  Map<int, bool> isselected = {
    1: false,
    2: false,
    4: false,
    5: false,
    6: false,
    7: false,
  };

  Map<int, Widget> navigatormap = {
    1: Working_on_it_page(),
    2: profile(),
    4: Working_on_it_page(),
    5: Working_on_it_page(),
    6: Working_on_it_page(),
    7: Working_on_it_page(),
  };

  void selecttile(int i) {
    isselected[i] = !isselected[i]!;

    notifyListeners();
  }

  void turnoff(int i) {
    for (int j = 1; j <= 7; j++) {
      if (j == i) {
        continue;
      } else {
        isselected[j] = false;
      }
    }
  }
}

class Listtilemodified extends StatelessWidget {
  const Listtilemodified(
      {Key? key,
      required this.tilenumber,
      required this.myicon,
      required this.mytext,
      required this.myiconsize})
      : super(key: key);
  final int tilenumber;

  final IconData myicon;

  final String mytext;

  final double myiconsize;

  @override
  Widget build(BuildContext context) {
    return Consumer<Provider_Drawer>(
      builder: (context, Provider_Drawer, child) {
        return Stack(children: [
          AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            duration: const Duration(
              milliseconds: 300,
            ),
            height: 57.h,
            width: Provider_Drawer.isselected[tilenumber]! ? 260.w : 0.w,
            child: Container(
              decoration: const BoxDecoration(
                color: KPrimarycolor,
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
            ),
          ),
          ListTile(
            visualDensity: VisualDensity(
                vertical: (0.013 * MediaQuery.of(context).size.height) - 11),
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(20))),
            leading: Icon(
              myicon,
              color: Provider_Drawer.isselected[tilenumber]!
                  ? Colors.white
                  : Kiconcolor,
              size: myiconsize,
            ),
            title: Text(
              mytext,
              style: TextStyle(
                color: Provider_Drawer.isselected[tilenumber]!
                    ? Colors.white
                    : Ktextcolor,
                fontSize: 18.sp,
              ),
            ),
            onTap: () {
              Provider_Drawer.selecttile(tilenumber);
              Provider_Drawer.turnoff(tilenumber);
              Timer(const Duration(milliseconds: 250), () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) =>
                          Provider_Drawer.navigatormap[tilenumber]!),
                );
              });
            },
          ),
        ]);
      },
    );
  }
}
