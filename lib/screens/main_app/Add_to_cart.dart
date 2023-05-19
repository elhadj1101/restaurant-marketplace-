import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/models/fakeDATA.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/widgets/default_button.dart';

import '../../constants.dart';
import 'category/food_details.dart';

class Add_to_cart extends StatelessWidget {
  const Add_to_cart({Key? key}) : super(key: key);

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
                    'Cart',
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
                ListView.builder(
                  itemCount: 2,
                  shrinkWrap: true,
                  physics:const  NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                  return const Order_In_Cart_card();
                },),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 18.w),
                  child:  Container(
                    height: 70.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.white,
                      border: Border.all(color: Colors.grey , width: 1 , )
                    ) ,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding:  EdgeInsets.fromLTRB( 28.0.w  , 0 , 10 , 0 ),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width/2.6,
                            child: TextFormField(
                              maxLines: 1,
                              cursorColor: KPrimarycolor,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Promo code',
                              ),
                            ),
                            ),
                          ),


                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 8.0.w, vertical: 8),
                          child:  default_button(text: 'Apply', x: 3.5, y: 12, button_color: KPrimarycolor , function: () {

                          },),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Column(
                    children: [
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'SubTotal',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text.rich(
                              TextSpan(
                                children:[
                                  TextSpan(
                                    text: '${myorders[1].total_price * 2 } ',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                  ),
                                  TextSpan(
                                    text: 'da',
                                    style: TextStyle(
                                      color: Colors.grey[600],
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16.sp,
                                    ),
                                  )
                                ]
                              )

                            ),
                          ],
                        ),
                      ),

                      const Divider(

                        color: Colors.grey,
                      ),
                      Padding(
                        padding:  EdgeInsets.symmetric(vertical: 8.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Delivery',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text.rich(
                                TextSpan(
                                    children:[
                                      TextSpan(
                                        text: '150 ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'da',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                        ),
                                      )
                                    ]
                                )

                            ),
                          ],
                        ),
                      ),

                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding:   EdgeInsets.symmetric(vertical: 8.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Total',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text.rich(
                                TextSpan(
                                    children:[
                                      TextSpan(
                                        text: '${myorders[1].total_price * 2 +150} ',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: 'da',
                                        style: TextStyle(
                                          color: Colors.grey[600],
                                          fontWeight: FontWeight.w500,
                                          fontSize: 16.sp,
                                        ),
                                      )
                                    ]
                                )

                            ),
                          ],
                        ),
                      ),



                    ],
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
               Padding(
                 padding:  EdgeInsets.symmetric(horizontal: 68.0.w),
                 child:   default_button(text: 'Order Now', x: 1  , y: 13, button_color: KPrimarycolor , function: () {

                 },),
               )
              ],
            ),
          ),
          const BackButton_customized()
        ],
      ),
    );
  }
}

class Order_In_Cart_card extends StatelessWidget {
  const Order_In_Cart_card({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.asset(
              myorders[1].image,
              height: 80.r,
              width: 80.r,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment:CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      mydishes[2].name,
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                     Container(

                      height: 22.r,
                      width: 22.r,
                      child: Image.asset('assets/images/cancelIcon.png'),
                    )
                  ],
                ),
                Text(
                  'Spicy , chicken , beef',
                  style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.grey,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                       '${mydishes[0].price} Da',
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: KPrimarycolor,
                          fontWeight: FontWeight.w600),
                    ),
                    Consumer<Provider_numberofitems>(
                      builder: (context, Provider_numberofitems, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Add_container( size: 32,
                              isitadd: false,
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            Text(
                              (Provider_numberofitems.num >= 0)
                                  ? Provider_numberofitems.num.toString()
                                  : 0.toString(),
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            SizedBox(
                              width: 10.w,
                            ),
                            const Add_container(isitadd: true , size: 32,),
                          ],
                        );
                      },
                    )
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
