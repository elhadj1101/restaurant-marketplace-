import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';

import '../../../Providers/restaurant_provider.dart';
import '../home_page/restaurand_card.dart';

class all_restauratns extends StatefulWidget {
  const all_restauratns({super.key});

  @override
  State<all_restauratns> createState() => _all_restauratnsState();
}

class _all_restauratnsState extends State<all_restauratns> {
  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    return Scaffold(
      body: GestureDetector(
        onTap: () =>      FocusScope.of(context).requestFocus( FocusNode()),
        child: Column(
          children: [
            Row(
              children: [
                const BackButton_customized(),
                SizedBox(width: 50.w,),
                Text("All Restaurants",style: TextStyle(color: Ktextcolor,fontSize: 18.sp,fontWeight: FontWeight.w400),)
              ],
            ),
            SizedBox(height: 10.h,),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 20.w),
              child: TextFormField(
                        cursorColor: KPrimarycolor,
                        decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              size: 28.r,
                              color: Colors.black54,
                            ),
                            hintText: 'find food or restaurant . . . ',
                            enabledBorder: const OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: Klighttextcolor,
                                ),
                                borderRadius:
                                    BorderRadius.all(Radius.circular(10))),
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                  color: KPrimarycolor,
                                  width: 2.w,
                                ),
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(10)))),
                      ),
            ),
            SizedBox(height: 30.h,),
            Expanded(
              child: FutureBuilder(
                  future: restaurantProvider.fetchRestaurants(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 60.w),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: restaurantProvider.restaurants.length,
                      itemBuilder: (context, index) {
                        return restaurant_card(
                          name: restaurantProvider.restaurants[index]["name"],
                          image: restaurantProvider.restaurants[index]
                              ["photoId"],
                          rating: restaurantProvider.restaurants[index]
                              ["rating"],
                        );
                      },
                    );
                  }),
            ),
          ],
        ),
      ),
    );
  }
}