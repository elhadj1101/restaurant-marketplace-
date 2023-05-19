import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/models/fakeDATA.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';

import '../starting_with_us/widgets/default_button.dart';

class Rating_page extends StatelessWidget {
  const Rating_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: const [Rating_contents(), BackButton_customized()],
      ),
    );
  }
}

class Rating_contents extends StatelessWidget {
  const Rating_contents({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<int, String> ratings = {
      1: 'Bad',
      2: 'Ok',
      3: 'Good',
      4: 'Excelent',
      5: 'Tastyy',
    };
    return SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(17.0.w, 0.169*MediaQuery.of(context).size.height -75.26, 17.w, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Stack(
                  children: [
                    Image.asset('assets/images/Rating.png'),
                    Padding(
                      padding: EdgeInsets.only(top: -0.105*MediaQuery.of(context).size.height + 192 ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 120.r,
                            width: 120.r,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            alignment: Alignment.center,
                            child: Container(
                                height: 95.r,
                                width: 95.r,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: const Color(0xFFFFC529),
                                  boxShadow: [
                                    BoxShadow(
                                        color: const Color(0xFFFFC529)
                                            .withOpacity(0.4),
                                        blurRadius: 10.r,
                                        spreadRadius: 4.r,
                                        offset: Offset(2.w, 3.h))
                                  ],
                                ),
                                alignment: Alignment.center,
                                child: Image.asset(
                                  'assets/images/logo.png',
                                  height: 70.h,
                                  width: 70.w,
                                )),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Text(
              myrestaurants[0].restaurant_name,
              style: TextStyle(
                  fontSize: 25.sp,
                  fontWeight: FontWeight.bold,
                  color: Colors.black),
            ),
            SizedBox(
              height: 5.h,
            ),
            Text(
              '4102 Pretty View Lanenda',
              // create class field for the position ,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Klighttextcolor,
              ),
            ),
            SizedBox(
              height: 15.h,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.circle,
                  color: Colors.green,
                  size: 10,
                ),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  myorders[0].status, // create class field for the position ,
                  style: TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.green,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Please Rate Delivery Service',
              // create class field for the position ,
              style: TextStyle(
                fontSize: 20.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Consumer<Provider_rating>(
              builder: (context, Provider_rating, child) {
                return Column(
                  children: [
                    Text(
                      ratings[Provider_rating.b] ?? '',
                      // create class field for the position ,
                      style: TextStyle(
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                        color: KPrimarycolor,
                      ),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    RatingBar(
                      ratingWidget: RatingWidget(
                          full: const Icon(
                            Icons.star,
                            color: Color(0xFFFFC529),
                          ),
                          half: const Icon(Icons.star),
                          empty: const Icon(
                            Icons.star_border_outlined,
                            color: Color(0xFFFFC529),
                          )),
                      onRatingUpdate: (value) {
                        Provider_rating.changerating(value.toInt());
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 25.0.w, vertical: 20.h),
                      child: TextFormField(
                          minLines: 1,
                          maxLines: 5,

                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 25.w, vertical: 20.h),
                            suffixIconColor: Klighttextcolor,
                            hintText: 'write your review',
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                gapPadding: 14.w,
                                borderSide:
                                    const BorderSide(color: Colors.grey)),
                            focusColor: Colors.grey,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11),
                                gapPadding: 14.w,
                                borderSide: BorderSide(
                                  color: KPrimarycolor,
                                  width: 2.w,
                                )),
                          )),
                    ),
                    Padding(
                      padding:  EdgeInsets.symmetric(horizontal: 40.0.w,vertical: 40.h),
                      child: default_button(text: 'Save', x: 1.5, y: 13, button_color: KPrimarycolor , function: () {

                      },),
                    ) ,
                  ],
                );
              },
            )
          ],
        ),
      ),
    );
  }
}

class Provider_rating extends ChangeNotifier {
  int b = 0;

  void changerating(int a) {
    notifyListeners();
    b = a;
  }
}
