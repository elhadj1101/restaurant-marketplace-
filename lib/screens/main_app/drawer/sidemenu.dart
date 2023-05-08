import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';

class Sidemenu extends StatelessWidget {
  const Sidemenu({Key? key}) : super(key: key);
  Future<void> _signOut() async {
    print('khrej');
    await FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
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
                  const Info_card(
                      name: 'Faressi Elhadj ',
                      email: 'faressielhadj@gmail.com '),
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
  const Info_card({Key? key, required this.name, required this.email})
      : super(key: key);
  final String name;

  final String email;

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
                child: Image.asset(
                  'assets/images/faressielhadj.jpeg',
                ),
              ),
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
            Listtilemodified(
                tilenumber: 2,
                myicon: Icons.person,
                mytext: 'My Profile',
                myiconsize: 27.r),
            Listtilemodified(
                tilenumber: 3,
                myicon: Icons.location_on,
                mytext: 'Delivery Adress',
                myiconsize: 27.r),
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
    3: false,
    4: false,
    5: false,
    6: false,
    7: false,
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
            },
          ),
        ]);
      },
    );
  }
}
