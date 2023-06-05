import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/main_app/favorites/button_provider.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/widgets/default_button.dart';

import '../../../Providers/restaurant_items_provider.dart';
import '../../../Providers/userProvider.dart';
import '../../starting_with_us/widgets/multi_choice_container.dart';
import '../category/category_page.dart';
import 'cancel_order.dart';
import '../../../Providers/orders_provider.dart';

class my_orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user_image = userProvider.image;
    final ordersprovider = Provider.of<OrdersProvider>(context);
    final orders = ordersprovider.orders;
    final itemsProvider = Provider.of<ItemsProvider>(context);
    final completedOrders = ordersprovider.completedOrders;
    final button_provider = Provider.of<buttonState>(context);
    return Scaffold(

        body: Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const BackButton_customized(),
          Text(
            "My Orders",
            style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w400),
          ),
          Padding(
            padding: EdgeInsets.only(right: 5.w),
            child: CircleAvatar(
              radius: 30.r,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: (user_image == "")
                      ? Image.asset('assets/images/default_avatar.png')
                      : Image.network(user_image, fit: BoxFit.cover)),
            ),
          ),
        ],
      ),
      multi_choice_container("My Orders", "History"),
      SizedBox(
        height: 32.h,
      ),
      Expanded(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: FutureBuilder(
              future: ordersprovider.getOrders(),
              builder: (context, snapshot) {
                return ListView.separated(
                  itemCount: button_provider.container1Color
                      ? orders.length
                      : completedOrders.length,
                  shrinkWrap: true,
                  itemBuilder: ((context, index) {
                    if (button_provider.container1Color) {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 10,
                        child: ListTile(
                            leading: ClipOval(
                                child: Image.network(
                              orders[index]["itemImage"],
                              fit: BoxFit.cover,
                              height: 50.h,
                              width: 50.w,
                            )),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(orders[index]["totalPrice"].toString()),
                                Text(orders[index]["status"])
                              ],
                            ),
                            title: Container(
                                margin: EdgeInsets.only(top: 10.h),
                                child: Text(
                                  orders[index]["itemName"],
                                )),
                            trailing: default_button(
                                text: "Cancel",
                                x: 5,
                                textsize: 10.sp,
                                y: 25,
                                button_color: KPrimarycolor,
                                function: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => const cancel_order(),
                                  ));
                                })),
                      );
                    } else {
                      return Card(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        elevation: 10,
                        child: ListTile(
                            leading: ClipOval(
                                child: Image.network(
                              completedOrders[index]["itemImage"],
                              fit: BoxFit.cover,
                              height: 50.h,
                              width: 50.w,
                            )),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(completedOrders[index]["totalPrice"]
                                    .toString()),
                                Text(completedOrders[index]["status"])
                              ],
                            ),
                            title: Text(completedOrders[index]["itemName"]),
                            trailing: default_button(
                                text: "Cancel",
                                x: 5,
                                textsize: 10.sp,
                                y: 25,
                                button_color: KPrimarycolor,
                                function: () {})),
                      );
                    }
                  }),
                  separatorBuilder: (BuildContext context, int index) =>
                      SizedBox(
                    height: 10.h,
                  ),
                );
              }),
        ),
      )
    ]));
  }
}
