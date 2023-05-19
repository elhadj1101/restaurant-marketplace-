import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import '../../../constants.dart';
import '../../main_app/favorites/button_provider.dart';


class multi_choice_container  extends StatelessWidget {
multi_choice_container(this.item1,this.item2, {super.key});
String item1;
String item2;
  @override
  Widget build(BuildContext context) {
    return        Center(
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                ),
                width: double.infinity,
                height: 55.h,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Consumer<buttonState>(
                        builder: (context, buttonState, _) => GestureDetector(
                              onTap: () {
                                buttonState.changeContainer1Color();
                              },
                              child: Container(
                                width: 150.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: buttonState.container1Color
                                      ? KPrimarycolor
                                      : Colors.white,
                                ),
                                child: Center(
                                    child: Text(
                                  item1,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: buttonState.container2Color
                                          ? KPrimarycolor
                                          : Colors.white),
                                )),
                              ),
                            )),
                    SizedBox(
                      width: 2.w,
                    ),
                    Consumer<buttonState>(
                        builder: (context, buttonState, _) => GestureDetector(
                              onTap: () {
                                buttonState.changeContainer2Color();
                              },
                              child: Container(
                                width: 150.w,
                                height: 55.h,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: buttonState.container2Color
                                      ? KPrimarycolor
                                      : Colors.white,
                                ),
                                child: Center(
                                    child: Text(
                                  item2,
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: buttonState.container1Color
                                          ? KPrimarycolor
                                          : Colors.white),
                                )),
                              ),
                            )),
                  ],
                ),
              ),
            );
  }
}