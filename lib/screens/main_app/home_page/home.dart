import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/models/fakeDATA.dart';

import '../drawer/sidemenu.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const AdressWidget(adress: '28 Rue de la Mosque , '),
        centerTitle: true,
        toolbarHeight: 90.h,
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 18.0.w),
        child: ListView(
          children: [
             SizedBox(
              height: 10.h,
            ),
             Text(
              'What would you like to  \n order ',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30.sp,
              ),
            ),
             SizedBox(
              height: 20.h,
            ),
            Row(
              children: [
                Expanded(
                  flex: 4,
                  child: TextFormField(
                    cursorColor: KPrimarycolor,
                    decoration:  InputDecoration(
                        prefixIcon: Icon(
                          Icons.search,
                          size: 28.r,
                          color: Colors.black54,
                        ),
                        hintText: 'find food or restaurant . . . ',
                        enabledBorder: const  OutlineInputBorder(
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
                           const  BorderRadius.all(Radius.circular(10)))),
                  ),
                ),
                 SizedBox(
                  width: 20.w,
                ),
                GestureDetector(
                  child: Container(
                    height: 54.w,
                    width: 54.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(13),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.4),
                            blurRadius: 2.r,
                            spreadRadius: 2.r,
                          )
                        ]),
                    alignment: Alignment.center,
                    child: Container(
                      color: Colors.white,
                      width: 25.w,
                      height: 25.w,
                      child: SvgPicture.asset(
                        fit: BoxFit.cover,
                        'assets/images/filter.svg',
                      ),
                    ),
                  ),
                ),
                 SizedBox(
                  width: 5.w,
                ),
              ],
            ),
             SizedBox(
              height: 10.w,
            ),
             SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              child: ListView.builder(

                itemCount: mycategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder:(context, index) {
                  return const  CategoryContainer()  ;
                }
                ,),
            )

          ],
        ),
      ),
    );
  }
}

class RestaurantCard extends StatelessWidget {
  const RestaurantCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(30),
            child: Image.asset('assets/images/realwelcome.png'),
          ),
          Container(
            height: 100.h,
            width: 100.w,
          )

        ],

      ),
    );
  }
}


class AdressWidget extends StatelessWidget {
  const AdressWidget({Key? key, required this.adress}) : super(key: key);
  final String adress;

  @override
  Widget build(BuildContext context) {
    String adresstoshow;
    if (adress.length > 19) {
      adresstoshow = adress.substring(0, 20) + '. . ';
    } else {
      adresstoshow = adress;
    }
    return GestureDetector(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
             Text(
              'Deliver to ',
              style: TextStyle(
                color: Colors.grey,
                fontSize: 14.sp,
              ),
            ),
            Icon(
              CupertinoIcons.chevron_down,
              color: Colors.grey.withOpacity(0.6),
              size: 18.r,
            )
          ]),
          Text(
            adresstoshow,
            style:  TextStyle(
              color: KPrimarycolor,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
            ),
          )
        ],
      ),
    );
  }
}

class CategoryContainer extends StatelessWidget {
  const CategoryContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(100),
          child: Container(
            height: 150.h,
            width: MediaQuery.of(context).size.width*0.205,
            color: KPrimarycolor,
            alignment: Alignment.topCenter,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    height: 70.h,
                    width: 70.w,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle
                    ),
                    child: Image.asset(
                      'assets/images/burger_category.png',height: 40.h , width: 40.w, fit: BoxFit.contain,
                    ),
                  ),
                   SizedBox(
                    height: 20.h,
                  ) , 
                  Text(mycategories[0].name)
                ],
              ),
            ),
          ),
        ),
         SizedBox(
          width: 10.w,
        ), 

      ],
    ) ;
  }
}
