import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/Providers/restaurant_items_provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/models/fakeDATA.dart';

import '../../../Providers/category_provider.dart';
import '../home_page/item_card.dart';
import '../home_page/restaurand_card.dart';
import 'food_details.dart';

class Category_page extends StatefulWidget {
  const Category_page({Key? key, }) : super(key: key);


  @override
  State<Category_page> createState() => _Category_pageState();
}

class _Category_pageState extends State<Category_page> {
  final sc = ScrollController();

  double b = 1 ;


  @override
  void initState() {
    sc.addListener(() {
      b = sc.offset;
      setState(() {
        b = (sc.offset <= 100) ? 1 - (sc.offset / 200) : 0;
      });
    });
    super.initState();
  }
  @override
  void setState(VoidCallback fn) {
    b = (sc.offset <= 100) ? 1 - (sc.offset / 200) : 0;

    // TODO: implement setState
    super.setState(fn);
  }


  @override
  Widget build(BuildContext context) {
    final categoryprovider = Provider.of<CategoryProvider>(context);
    final itemsProvider = Provider.of<ItemsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedOpacity(
            duration: const  Duration(milliseconds: 500),
            opacity: b,
            child: Transform.translate(
              offset: Offset(40.w, -55.h),
              child: Transform.scale(
                  scale: MediaQuery.of(context).size.height / 1032.h,
                  child: Image.asset('assets/images/pizza_category.png')),
            ),
          ),
          Positioned(
            right: -130.w,
            top: -180.h,
            child: Transform.translate(
              offset: Offset(40.w, -55.h),
              child: Transform.scale(
                scale: MediaQuery.of(context).size.height / 1032.h,
                child: Container(
                  height: 545.r,
                  width: 458.r,
                  decoration: BoxDecoration(
                      color: Colors.transparent,
                      borderRadius: BorderRadius.circular(200),
                      boxShadow: [
                        BoxShadow(
                            color: KPrimarycolor.withOpacity(0.2),
                            blurRadius: 100.r,
                            spreadRadius: 25.r,
                            offset: Offset(2.w, 3.h))
                      ]),
                ),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0.w),
            child: ListView(
              controller: sc,

              children: [
                Padding(
                  padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height / 9),
                  child: Text.rich(
                    TextSpan(children: [
                      TextSpan(
                          text: 'Fast\n',
                          style: TextStyle(
                              fontSize: 47.sp,
                              fontWeight: FontWeight.bold,
                              color: Colors.black)),
                      TextSpan(
                          text: 'Food\n',
                          style: TextStyle(
                              fontSize: 55.sp,
                              fontWeight: FontWeight.bold,
                              color: KPrimarycolor)),
                      TextSpan(
                          text: 'Discover our \ndelicious menus',
                          style: TextStyle(
                              fontSize: 18.sp, color: Klighttextcolor)),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),

                SizedBox(
                    width: double.infinity,
                    child: ListView.builder(
                      shrinkWrap: true,
                      padding: const EdgeInsets.only(bottom: 20),
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: categoryprovider.items.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: ()  async{
                            await categoryprovider.getDocId(index , categoryprovider.items[index]["category"]);
                            String  id = categoryprovider.DocId ;
                            String image =
                            categoryprovider.items[index]["photoId"];
                            String name =
                            categoryprovider.items[index]["name"];
                            String price =
                            categoryprovider.items[index]["price"];
                            String description =
                            categoryprovider.items[index]["description"];
                            String DeleveryPrice =
                            categoryprovider.items[index]["deliveryPrice"];
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return  Food_details(DOCID: id, description:description , image: image, name: name, price: price,DelPrice:DeleveryPrice);
                              },
                            ));


                          },
                          child: Column(
                            children: [
                              Stack(
                                children: [
                                   Dish_widget(index: index),

                                  Positioned(
                                    left: MediaQuery.of(context).size.width*0.73,
                                    top: 12.h,
                                    child: const favorite_widget3() ,
                                  ),
                                  Positioned(
                                      left: 15.w,
                                      top: -0.07 * MediaQuery.of

                                        (context).size.height + 208 ,
                                      child: Container(
                                          decoration:  BoxDecoration(
                                              boxShadow: [
                                                BoxShadow(
                                                    color: Colors.grey.withOpacity(0.5),
                                                    blurRadius: 10.r,
                                                    spreadRadius: 7.r,
                                                    offset: Offset(2.w, 3.h))
                                              ]),
                                          child:  price_widget(price: categoryprovider.items[index]["price"],))),
                                ],),
                              SizedBox(
                                height: 10.h,
                              )
                            ],
                          ),
                        );
                      },
                    ) ,),
              ],
            ),
          ),
          const BackButton_customized()
        ],
      ),
    );
  }
}

class BackButton_customized extends StatelessWidget {
  const BackButton_customized({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: 25.w,
          vertical: 0.20 * MediaQuery.of(context).size.height - 92),
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
          height: 40.r,
          width: 40.r,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(18),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.4),
                    blurRadius: 10.r,
                    spreadRadius: 4.r,
                    offset: Offset(2.w, 3.h))
              ]),
          child: Icon(
            Icons.chevron_left,
            size: 30.r,
          ),
        ),
      ),
    );
  }
}

class Provider_dropdown extends ChangeNotifier {
  String choosedvalue = 'Popular';

  void change_choosedvalue(String a) {
    choosedvalue = a;
    notifyListeners();
  }
}

class Dish_widget extends StatelessWidget {
  const Dish_widget({Key? key, required this.index}) : super(key: key);
  final int index ;
  @override
  Widget build(BuildContext context) {
    final categoryprovider = Provider.of<CategoryProvider>(context);
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 10,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(16),
              topLeft: Radius.circular(16),
            ),
            child: Image.network(categoryprovider.items[index]["photoId"] , height: 164, width: 400,fit: BoxFit.cover,),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  categoryprovider.items[index]["name"],
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      categoryprovider.items[index]["rest_name"],
                      style: TextStyle(fontSize: 17.sp, color: Klighttextcolor),
                    ),
                    SizedBox(
                      width: 7.w,
                    ),
                    Icon(
                      Icons.check_circle,
                      color: Color(0xFF029094),
                      size: 16.r,
                    ),
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

class Provider_scroll extends ChangeNotifier {
  double a = 0;

  void justnotify() {
    a = a;
    print('thiiiiiis is $a');
    notifyListeners();
  }

}

class favorite_widget3 extends StatelessWidget {
  const favorite_widget3({Key? key}) : super(key: key);

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
              color: Provider_favorite_item.isit_favorite ? Colors.white : Colors.grey[400], size: 20.r,
            ),
          ),
        ),
      );
    },) ;
  }
}