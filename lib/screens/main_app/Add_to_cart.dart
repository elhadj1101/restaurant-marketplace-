import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/Providers/userProvider.dart';
import 'package:restaurant_marketplace_h/models/fakeDATA.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/widgets/default_button.dart';

import '../../Providers/restaurant_items_provider.dart';
import '../../constants.dart';
import 'category/food_details.dart';

class Add_to_cart extends StatefulWidget {
  const Add_to_cart({Key? key}) : super(key: key);

  @override
  State<Add_to_cart> createState() => _Add_to_cartState();
}

class _Add_to_cartState extends State<Add_to_cart> {
  final _codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final itemProvider = Provider.of<ItemsProvider>(context as BuildContext);

    final NumberItems = Provider.of<Provider_numberofitems>(
        context as BuildContext,
        listen: true);
    final userProvider = Provider.of<UserProvider>(context as BuildContext);
    int ItemPrice = itemProvider.document["price"];
    int DeliveryPrice = itemProvider.document["deliveryPrice"];
 

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
                  itemCount: 1,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const Order_In_Cart_card();
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18.w),
                  child: Container(
                    height: 70.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.white,
                        border: Border.all(
                          color: itemProvider.promoColor,
                          width: 1,
                        )),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(28.0.w, 0, 10, 0),
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width / 2.6,
                            child: TextField(
                              controller: _codeController,
                              cursorColor: KPrimarycolor,
                              onTap: () {},
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Promo code',
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: 8.0.w, vertical: 8),
                          child: default_button(
                            text: 'Apply',
                            x: 3.5,
                            y: 12,
                            button_color: KPrimarycolor,
                            function: () {
                              String code = _codeController.text.trim();
                              itemProvider.checkPromo(code);

                              
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.0.w),
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0.h),
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
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: '${ItemPrice * NumberItems.num} ',
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
                            ])),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0.h),
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
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: '$DeliveryPrice',
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
                            ])),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0.h),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Discount',
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                              ),
                            ),
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text: '${itemProvider.discount * 100} %',
                                style: TextStyle(
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                ),
                              )
                            ])),
                          ],
                        ),
                      ),
                      const Divider(
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 8.0.h),
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
                            Text.rich(TextSpan(children: [
                              TextSpan(
                                text:
                                    '${((ItemPrice * NumberItems.num) + DeliveryPrice) - ((ItemPrice * NumberItems.num) + DeliveryPrice) * itemProvider.discount} ',
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
                            ])),
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
                  padding: EdgeInsets.symmetric(horizontal: 68.0.w),
                  child: default_button(
                    text: 'Order Now',
                    x: 1,
                    y: 13,
                    button_color: KPrimarycolor,
                    function: () async {
                      try {
                        await FirebaseFirestore.instance
                            .collection('Orders')
                            .add({
                          'address': userProvider.address,
                          'createdDate': DateTime.now(),
                          'userId': userProvider.userID,
                          'restaurentId': itemProvider.document["restaurentId"],
                          'itemId': itemProvider.DocId,
                          'status': "suspended",
                          'numberOfItems': NumberItems.num,
                          'totalPrice':
                              ItemPrice * NumberItems.num + DeliveryPrice,
                          'userPhone': userProvider.phone,
                        });
                      } catch (e) {
                        print('Error creating user: $e');
                      }
                    },
                  ),
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
    final itemProvider = Provider.of<ItemsProvider>(context as BuildContext);
    String photo = itemProvider.document["photoId"] ?? '';
    String ItemName = itemProvider.document["name"] ?? '';
    String ItemCategory = itemProvider.document["category"] ?? '';
    String ItemPrice = itemProvider.document["price"].toString();

    return Card(
      color: Colors.white,
      elevation: 0,
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(15),
            child: Image.network(
              photo,
              height: 80.r,
              width: 80.r,
            ),
          ),
          SizedBox(
            width: 15.w,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      ItemName,
                      style: TextStyle(
                          fontSize: 22.sp,
                          color: Colors.black87,
                          fontWeight: FontWeight.w600),
                    ),
                    // Container(
                    //   height: 22.r,
                    //   width: 22.r,
                    //   child: Image.asset('assets/images/cancelIcon.png'),
                    // )
                  ],
                ),
                Text(
                  ItemCategory,
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
                      '$ItemPrice Da',
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
                            const Add_container(
                              size: 32,
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
                            const Add_container(
                              isitadd: true,
                              size: 32,
                            ),
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
