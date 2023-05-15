import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_marketplace_h/models/fakeDATA.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';

import '../../../constants.dart';

class reviews_page extends StatelessWidget {
  const reviews_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 25.h, 10.w, 0),
            child: ListView(

              shrinkWrap: true,
              children: [
                Center(
                  child: Text(
                    'Reviews',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 25.sp,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 10.0.w, vertical: 20.h),
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
                            borderSide: const BorderSide(color: Colors.grey)),
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
                SizedBox(
                  height: 10.h,
              ),
                ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemCount: myreviews.length,
                  itemBuilder: (context, index) {
                    return const review_card();
                  },
                ),
              ],
            ),
          ),
          BackButton_customized()
        ],
      ),
    );
  }
}

class review_card extends StatelessWidget {
  const review_card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0.h),
      child: Card(
        elevation: 0,
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Stack(
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            myusers[0].photo_id,
                            height: 60.r,
                            width: 60.r,
                          ),
                        ),
                        Positioned(
                          left: 40.w,
                          top: 40.h,
                          child: Container(
                            height: 20.r,
                            width: 20.r,
                            decoration: const BoxDecoration(
                                color: Color(0xFFFFC529),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(7)),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                  )
                                ]),
                            alignment: Alignment.center,
                            child: Text(
                              myreviews[0].rating.toString(),
                              style: TextStyle(
                                  fontSize: 10.sp, color: Colors.white),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          myusers[0].fullname,
                          style:
                              TextStyle(fontSize: 15.sp, color: Colors.black),
                        ),
                        Text(
                          myreviews[0].created_date,
                          style: TextStyle(fontSize: 13.sp, color: Colors.grey),
                        ),
                      ],
                    )
                  ],
                ),
                IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.more_vert_outlined,
                      color: Colors.grey,
                    ))
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            Text(myreviews[0].descreption),
            SizedBox(
              height: 8.h,
            ),
          ],
        ),
      ),
    );
  }
}
