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
  const Category_page({Key? key, required this.categoryId}) : super(key: key);
  final String  categoryId  ;
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
    final categoryProvider = Provider.of<CategoryProvider>(context);
    final itemsProvider = Provider.of<ItemsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        clipBehavior: Clip.none,
        children: [
          AnimatedOpacity(
            duration: const  Duration(milliseconds: 1000),
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
                          text: '80 types of pizza',
                          style: TextStyle(
                              fontSize: 18.sp, color: Klighttextcolor)),
                    ]),
                  ),
                ),
                SizedBox(
                  height: 25.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          'sort by :  ',
                          style: TextStyle(
                              fontSize: 19.sp, fontWeight: FontWeight.bold),
                        ),
                        Consumer<Provider_dropdown>(
                          builder: (context, Provider_dropdown, child) {
                            return DropdownButton(
                              underline: const SizedBox(),
                              iconEnabledColor: Colors.black,
                              borderRadius: BorderRadius.circular(20),
                              dropdownColor: Colors.white,
                              hint: Text(Provider_dropdown.choosedvalue),
                              icon: const Icon(
                                CupertinoIcons.chevron_down,
                                size: 20,
                                color: KPrimarycolor,
                              ),
                              items: [
                                DropdownMenuItem(
                                  value: 'Popular',
                                  child: Text(
                                    'Popular',
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w500,
                                        color: KPrimarycolor),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Newest',
                                  child: Text(
                                    'Newest',
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w500,
                                        color: KPrimarycolor),
                                  ),
                                ),
                                DropdownMenuItem(
                                  value: 'Nearest',
                                  child: Text(
                                    'Nearest',
                                    style: TextStyle(
                                        fontSize: 19.sp,
                                        fontWeight: FontWeight.w500,
                                        color: KPrimarycolor),
                                  ),
                                ),
                              ],
                              onChanged: (value) {
                                Provider_dropdown.change_choosedvalue(
                                    value ?? 'Popular');
                              },
                            );
                          },
                        )
                      ],
                    ),
                    GestureDetector(
                      child: Container(
                          height: 30.r,
                          width: 30.r,
                          child: Image.asset(
                            'assets/images/filter_icon.png',
                          )),
                    ),
                  ],
                ),
                SizedBox(
                    width: double.infinity,
                    child: FutureBuilder(
                      future : categoryProvider.fetchcategoryItems(widget.categoryId) ,
                      builder: (context, snapshot) {
                        return ListView.builder(
                          shrinkWrap: true,
                          padding: const EdgeInsets.only(bottom: 20),
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: categoryProvider.items.length,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                              onTap: ()  async{
                                await categoryProvider.getDocId(index , widget.categoryId);
                                String  id = categoryProvider.DocId ;
                                Navigator.of(context).push(MaterialPageRoute(
                                  builder: (context) {
                                    return  Food_details(DOCID: id );
                                  },
                                ));


                              },
                              child: Column(
                                children: [
                                  Stack(
                                    children: [
                                      const Dish_widget(),
                                      const review_widget(rating: 0),
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
                                              child: const price_widget(price: 22,))),
                                    ],),
                                  SizedBox(
                                    height: 10.h,
                                  )
                                ],
                              ),
                            );
                          },
                        ) ;
                      },
                    )),
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
  const Dish_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            child: Image.asset(mydishes[0].photo_id),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 18.0.h, horizontal: 12.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  mydishes[0].name,
                  style: TextStyle(
                    fontSize: 25.sp,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  '${mydishes[0].additions[0].name}, ${mydishes[0].additions[1].name}, ${mydishes[0].additions[2].name}',
                  style: TextStyle(fontSize: 14.sp, color: Klighttextcolor),
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