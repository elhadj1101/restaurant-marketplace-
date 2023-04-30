
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/screens/main_app/drawer/sidemenu.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/home.dart';

import '../../../constants.dart';

class  Home_screen extends StatefulWidget {
  const Home_screen({Key? key}) : super(key: key);

  @override
  State<Home_screen> createState() => _Home_screenState();
}

class _Home_screenState extends State<Home_screen>
    with SingleTickerProviderStateMixin {
  late AnimationController animc;

  late Animation<double> anim;

  late Animation<double> scaleanim;

  @override
  void initState() {
    animc = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300))
      ..addListener(() {
        Provider_home;
      });
    anim = Tween<double>(begin: 0.w, end: 230.w)
        .animate(CurvedAnimation(parent: animc, curve: Curves.linear));

    scaleanim = Tween<double>(begin: 1, end: 0.72)
        .animate(CurvedAnimation(parent: animc, curve: Curves.linear));

    super.initState();
  }

  @override
  void dispose() {
    animc.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return Consumer<Provider_home>(
      builder: (context, Provider_home, child) {
        return Scaffold(
          backgroundColor: KLightcolor,
          body: Stack(
            children: [
              AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  width: 280.w,
                  left: Provider_home.is_side_menu_opened ? 0.w : -230.w,
                  curve: Curves.fastOutSlowIn,
                  height: MediaQuery.of(context).size.height,
                  child: const Sidemenu()),
              Transform(
                alignment: Alignment.center,
                transform: Matrix4.identity()
                  ..setEntry(3, 2, 0.001)
                  ..rotateY(Provider_home.is_side_menu_opened ? 1 - 30 * pi / 180:  0 ),
                child: Transform.translate(
                    offset:
                        Offset(Provider_home.is_side_menu_opened ? 230.w : 0.w, 0.h),
                    child: Transform.scale(
                        scale: Provider_home.is_side_menu_opened ? 0.72 : 1,
                        child: ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(
                              Provider_home.is_side_menu_opened ? 40 : 0)),
                          child: const Home(),
                        ))),
              ),
              Sidemenubtn(
                press: () {
                  Provider_home.opensidemenu();
                  if (Provider_home.is_side_menu_opened) {
                    animc.forward();
                  } else {
                    animc.reverse();
                  }
                },
              ),
            ],
          ),
        );
      },
    );
  }
}

class Sidemenubtn extends StatelessWidget {
  const Sidemenubtn({Key? key, required this.press}) : super(key: key);
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return Consumer<Provider_home>(
      builder: (context, Provider_home, child) {
        return Provider_home.is_side_menu_opened
            ? Transform.translate(
                offset: Offset(230.w, 0.h),
                child: Transform.scale(
                  scale: 0.72,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                    child: GestureDetector(
                      onTap: press,
                      child: Container(
                        height: double.infinity,
                        width: double.infinity,
                        color: Colors.transparent,
                      ),
                    ),
                  ),
                ),
              )
            : Padding(
                padding:  EdgeInsets.symmetric(horizontal: 25.w , vertical: 0.20 * MediaQuery.of(context).size.height - 92 ),
                child: GestureDetector(
                  onTap: () {
                    Provider_home.opensidemenu();
                  },
                  child: Container(
                    height: 40.r,
                    width: 40.r,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(18),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.4),
                              blurRadius: 10.r,
                              spreadRadius: 7.r,
                              offset:  Offset(2.w, 3.h))
                        ]),
                    child: const Icon(
                      Icons.menu,
                    ),
                  ),
                ),
              );
      },
    );
  }
}

class Provider_home extends ChangeNotifier {
  bool is_side_menu_opened = false;


  void opensidemenu() {
    is_side_menu_opened = !is_side_menu_opened;
    notifyListeners();
  }
}
