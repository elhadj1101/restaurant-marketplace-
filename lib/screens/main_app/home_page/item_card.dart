// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';

class item_card extends StatelessWidget {
  const item_card({Key? key, required this.rest_name, required this.item_name, required this.item_photo, required this.item_price}) : super(key: key);
  final String rest_name ;
  final String item_name ;
  final String item_photo ;
  final String item_price ;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:  [
        item_widget(image: item_photo  , item_name: item_name , rest_name: rest_name),
        Positioned(
            left: 10.w,
            top: 10.h,
            child: price_widget(price: item_price,)),
        Positioned(
            left: 138.w,
            top: 10.h,
            child: const favorite_widget()
        ),
      ],
    );
  }
}

class item_widget extends StatelessWidget {
  const item_widget({Key? key, required this.rest_name, required this.item_name, required this.image}) : super(key: key);
  final String rest_name ;
  final String item_name ;
  final String image ;

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(20),
              topLeft: Radius.circular(20),
            ),
            child: Image.network( image ,  height: 170.h,width: 170.w,fit: BoxFit.cover,),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(10.w, 5.h, 0, 0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  (item_name.length >= 14) ? '${item_name.substring(0 , 13)}..' : item_name,
                  style: TextStyle(
                    fontSize: 17.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),

                SizedBox(
                  height: 3.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      rest_name,
                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    const Icon(
                      Icons.check_circle,
                      color: Color(0xFF029094),
                      size: 16,
                    ),
                  ],
                ),


                SizedBox(
                  height: 8.h,
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}


class price_widget extends StatelessWidget {
  const price_widget({Key? key, required this.price}) : super(key: key);
  final String price ;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      height: 30.h,
      width: 70.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.white,
      ),
      child: Text.rich(
          TextSpan(
              children: [
                TextSpan(
                  text: price.toString(),
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp

                  ),
                ),
                                TextSpan(
                  text: "DA",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.sp,
                      color: KPrimarycolor

                  ),
                ),

              ]
          )
      ),
    );
  }
}

class favorite_widget extends StatelessWidget {
  const favorite_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Provider_favorite_item>(builder: (context, Provider_favorite_item, child) {
      return GestureDetector(
        onTap: () {
          Provider_favorite_item.make_favorite() ;
        },
        child: Container(
          height: 30.r,
          width: 30.r,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            color:  KPrimarycolor  ,

          ),
          child: Container(
            decoration:  BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.5),
                    blurRadius: 10,
                  )
                ]
            ),
            child: Icon(
              Icons.favorite ,
              color:Colors.white, size: 20.r,
            ),
          ),
        ),
      );
    },) ;
  }
}

class Provider_favorite_item extends ChangeNotifier {
  bool isit_favorite = false;

  void make_favorite() {
    isit_favorite = !isit_favorite;
    notifyListeners();
  }
}