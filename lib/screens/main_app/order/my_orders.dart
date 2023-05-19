import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../starting_with_us/widgets/multi_choice_container.dart';
import '../category/category_page.dart';
import '../profile /profile.dart';

class my_orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const BackButton_customized(),
                Text(
                  "My Orders",
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0)),
                    child:  Text("Here Pic of usr")),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
              multi_choice_container("Upcoming","History"),
             SizedBox(height: 32.h,),
             
             ]
    )));
  }
}