
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/main_app/favorites/button_provider.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/widgets/default_button.dart';

import '../../../Providers/userProvider.dart';
import '../../starting_with_us/widgets/multi_choice_container.dart';
import '../category/category_page.dart';
import 'cancel_order.dart';
import 'orders_provider.dart';

class my_orders extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final user_image = userProvider.image;
     final ordersprovider = Provider.of<ordersProvider>(context);
     final orders = ordersprovider.orders;
    final button_provider = Provider.of<buttonState>(context);
    return Scaffold(
        body: Column(
        children: [
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
          padding:  EdgeInsets.symmetric(horizontal: 10.w),
          child: FutureBuilder(
            future: ordersprovider.getOrders() ,
            builder: (context, snapshot) {
              return ListView.separated(
              itemCount: button_provider.container1Color? orders.length : 4,
              shrinkWrap: true,
              itemBuilder: ((context, index) {
                if (button_provider.container1Color) {
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 10,
                    child: ListTile(
                      leading: ClipOval(child: Image.asset('assets/images/item1.jpg',fit: BoxFit.cover,height: 50.h,width: 50.w,)),
                      subtitle:  const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price"),
                          Text("status",style: TextStyle(),)
                        ],
                      ),
                      title: Container(margin: EdgeInsets.only(top: 10.h),child: const Text("Name of the dish",)),
                      trailing:   default_button(text: "Cancel",x: 5,textsize: 10.sp, y: 25, button_color: KPrimarycolor, function: (){
                        Navigator.of(context).push(MaterialPageRoute(builder :(context) => const cancel_order(), ));
                      })
                    ),
                  ) ;
                } else {
                  
                  return Card(
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                    elevation: 10,
                    child: ListTile(
                      leading: ClipOval(child: Image.asset('assets/images/item1.jpg',fit: BoxFit.cover,height: 50.h,width: 50.w,)),
                      subtitle: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Price"),
                        ],
                      ),
                      title: const Text("Name of the dish"),
                      // here you have to set condition order canceled or completed 
                      trailing: true ? const Icon(Icons.check,color: Colors.green) : const Icon(Icons.cancel,color: Colors.red) 
                    ),
                  ) ;
                }
              }), separatorBuilder: (BuildContext context, int index) => SizedBox(height: 10.h,),);
            }
          ),
        ),
      )
    ]));
  }
}
