import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';

import '../../../Providers/restaurant_items_provider.dart';
import '../../../Providers/restaurant_provider.dart';
import '../category/food_details.dart';
import '../home_page/item_card.dart';

class restaurant_page extends StatelessWidget {
  const restaurant_page(
      {Key? key,
      required this.restId,
      required this.restName,
      required this.restAddress,
      required this.restRating,
      required this.restImage})
      : super(key: key);
  final String restId;
  final String restName;
  final String restAddress;
  final double restRating;
  final String restImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          restaurantcontents(
              restId: restId,
              restName: restName,
              restAddress: restAddress,
              restRating: restRating,
              restImage: restImage),
          const BackButton_customized()
        ],
      ),
    );
  }
}

class restaurantcontents extends StatelessWidget {
  const restaurantcontents(
      {Key? key,
      required this.restId,
      required this.restName,
      required this.restAddress,
      required this.restRating,
      required this.restImage})
      : super(key: key);
  final String restId;
  final String restName;
  final String restAddress;
  final double restRating;
  final String restImage;

  @override
  Widget build(BuildContext context) {
    final itemsProvider = Provider.of<ItemsProvider>(context);

    return SingleChildScrollView(
        child: Center(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(17.0.w,
                0.169 * MediaQuery.of(context).size.height - 75.26, 17.w, 0),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: BorderRadius.circular(18),
                      child: Image.network(
                        restImage,
                        height: 166.h,
                        width: 360.w,
                        fit: BoxFit.cover,
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                        top: -0.105 * MediaQuery.of(context).size.height + 192),
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
          SizedBox(
            height: 10.h,
          ),
          Text(
            restName,
            style: TextStyle(
                fontSize: 25.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black),
          ),
          SizedBox(
            height: 5.h,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              (restAddress.length <= 40)
                  ? restAddress
                  : '${restAddress.substring(0, 40)}...',
              // create class field for the position ,
              style: TextStyle(
                fontSize: 15.sp,
                fontWeight: FontWeight.w400,
                color: Klighttextcolor,
              ),
            ),
          ),
          Text.rich(TextSpan(children: [
            WidgetSpan(
                child: Icon(
              Icons.star,
              color: const Color(0xFFFFC529),
              size: 23.r,
            )),
            WidgetSpan(
                child: SizedBox(
              width: 8.w,
            )),
            TextSpan(
                text: '${restRating}',
                style: TextStyle(fontSize: 17.sp, fontWeight: FontWeight.w700)),
            WidgetSpan(
                child: SizedBox(
              width: 8.w,
            )),
            WidgetSpan(
                child: GestureDetector(
              child: Text(
                'see review',
                style: TextStyle(
                    color: KPrimarycolor,
                    fontSize: 14.sp,
                    decoration: TextDecoration.underline),
              ),
            )),
          ])),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0.w),
            child: Container(
                child: FutureBuilder(
              future: itemsProvider.fetchItemsId(restId),
              builder: (context, snapshot) {
                return GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 190.w,
                      mainAxisExtent: 250.h,
                      childAspectRatio: 2,
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10.h),
                  itemCount: itemsProvider.onerest_items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await itemsProvider.getDocId(index);
                        String id = itemsProvider.DocId;
                        String image =
                            itemsProvider.onerest_items[index]["photoId"];
                        String name =
                            itemsProvider.onerest_items[index]["name"];
                        String price =
                            itemsProvider.onerest_items[index]["price"];
                        String description =
                            itemsProvider.onerest_items[index]["description"];
                              String DeleveryPrice =
                            itemsProvider.items[index]["deliveryPrice"];
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Food_details(
                                DOCID: id,
                                name: name,
                                price: price,
                                description: description,
                                image: image,DelPrice:DeleveryPrice);
                          },
                        ));
                      },
                      child: item_card(
                          rest_name: itemsProvider.onerest_items[index]
                              ["rest_name"],
                          item_name: itemsProvider.onerest_items[index]["name"],
                          item_photo: itemsProvider.onerest_items[index]
                              ["photoId"],
                          item_price: itemsProvider.onerest_items[index]
                              ["price"]),
                    );
                    ;
                  },
                );
              },
            )),
          ),
        ],
      ),
    ));
  }
}
