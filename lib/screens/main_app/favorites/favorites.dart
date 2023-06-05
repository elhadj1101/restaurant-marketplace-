import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';
import 'package:restaurant_marketplace_h/screens/main_app/profile%20/profile.dart';

import '../../../models/fakeDATA.dart';
import '../../starting_with_us/widgets/multi_choice_container.dart';
import '../home_page/item_card.dart';
import '../home_page/restaurand_card.dart';

class favorites extends StatelessWidget {
  const favorites({super.key});

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
                  "Favorites",
                  style:
                      TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
                ),
                Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15.0)),
                    child: const profile_avatar()),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
             multi_choice_container("Food Items","Resturents"),
            SizedBox(
              height: 32.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
              child: ListView.builder(
                shrinkWrap: true,
                padding: const EdgeInsets.only(bottom: 20),
                physics: const NeverScrollableScrollPhysics(),
                itemCount: mydishes.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      Stack(
                        children: [
                          const Dish_widget(),
                          const review_widget(rating: 0),
                          Positioned(
                            left: MediaQuery.of(context).size.width * 0.73,
                            top: 12.h,
                            child: const favorite_widget3(),
                          ),
                          Positioned(
                              left: 15.w,
                              top: -0.07 * MediaQuery.of(context).size.height +
                                  208,
                              child: Container(
                                  decoration: BoxDecoration(boxShadow: [
                                    BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        blurRadius: 10.r,
                                        spreadRadius: 7.r,
                                        offset: Offset(2.w, 3.h))
                                  ]),
                                  child: const price_widget(price: "00",))),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      )
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}


