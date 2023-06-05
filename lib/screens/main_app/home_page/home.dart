import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/models/fakeDATA.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/food_details.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/item_card.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/restaurand_card.dart';
import '../../../Providers/restaurant_items_provider.dart';
import '../../../Providers/restaurant_provider.dart';
import '../../../Providers/userProvider.dart';
import '../map/map_screen.dart';
import 'package:restaurant_marketplace_h/screens/main_app/restaurants_page/restaurant_page.dart';

import '../restaurants_page/all_restaurants.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    final restaurantProvider = Provider.of<RestaurantProvider>(context);
    final itemsProvider = Provider.of<ItemsProvider>(context);
    final userProvider = Provider.of<UserProvider>(context);
    List a = userProvider.address.split('-');
    String address = a[a.length - 1];
    return Scaffold(
      bottomNavigationBar: Consumer<Provider_Category>(
        builder: (context, Provider_Category, child) {
          return NavigationBar(
              backgroundColor: Colors.white,
              elevation: 20,
              height: 70.h,
              destinations: [
                IconButton(
                  onPressed: () {
                    Provider_Category.selectpage(0);
                    Provider_Category.turnoffselectedpage(0);
                  },
                  icon: const Icon(Icons.explore),
                  color: Provider_Category.isitpressed[0]!
                      ? KPrimarycolor
                      : Colors.grey,
                ),
                IconButton(
                  onPressed: () {
                    Provider_Category.selectpage(1);
                    Provider_Category.turnoffselectedpage(1);
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => MapScreen(),
                    ));
                  },
                  icon: const Icon(Icons.location_on),
                  color: Provider_Category.isitpressed[1]!
                      ? KPrimarycolor
                      : Colors.grey,
                ),
                IconButton(
                  onPressed: () {
                    Provider_Category.selectpage(2);
                    Provider_Category.turnoffselectedpage(2);
                  },
                  icon: const Icon(Icons.shopping_bag),
                  color: Provider_Category.isitpressed[2]!
                      ? KPrimarycolor
                      : Colors.grey,
                ),
                IconButton(
                  onPressed: () {
                    Provider_Category.selectpage(3);
                    Provider_Category.turnoffselectedpage(3);
                  },
                  icon: const Icon(Icons.favorite),
                  color: Provider_Category.isitpressed[3]!
                      ? KPrimarycolor
                      : Colors.grey,
                ),
                IconButton(
                  onPressed: () {
                    Provider_Category.selectpage(4);
                    Provider_Category.turnoffselectedpage(4);
                  },
                  icon: const Icon(Icons.notification_important_rounded),
                  color: Provider_Category.isitpressed[4]!
                      ? KPrimarycolor
                      : Colors.grey,
                ),
              ]);
        },
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 18.0.w),
        child: ListView(
          children: [
            Padding(
              padding: EdgeInsets.only(top: 20.h),
              child: AdressWidget(adress: address),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              'What would you like to  \norder ',
              style: TextStyle(
                fontWeight: FontWeight.w600,
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
              height: 10.h,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              height: 200.h,
              child: ListView.builder(
                itemCount: mycategories.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  bool isitnull = false;
                  if (index == null) {
                    isitnull = true;
                  }
                  return CategoryContainer(ii: isitnull ? 0 : index);
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Featured restaurant ',
                  style:
                      TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) {
                        return const all_restauratns();
                      },
                    ));
                  },
                  child: Row(
                    children: [
                      Text(
                        'view all ',
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: KPrimarycolor,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.chevron_right,
                        size: 15.w,
                        color: KPrimarycolor,
                      )
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: 260.h,
              child: FutureBuilder(
                  future: restaurantProvider.fetchRestaurants(),
                  builder: (context, snapshot) {
                    return ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: restaurantProvider.restaurants.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () async {
                            await restaurantProvider.getDocId(index);
                            String id = restaurantProvider.restId;
                            String image = restaurantProvider.restaurants[index]
                                ["photoId"];
                            String name =
                                restaurantProvider.restaurants[index]["name"];
                            double rating =
                                restaurantProvider.restaurants[index]["rating"];
                            String address=restaurantProvider.restaurants[index]["mapAddress"];
                            Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) {
                                return restaurant_page(restId: id,restName:name,restAddress:address,restRating:rating,restImage:image);
                              },
                            ));
                          },
                          child: restaurant_card(
                            name: restaurantProvider.restaurants[index]["name"],
                            image: restaurantProvider.restaurants[index]
                                ["photoId"],
                            rating: restaurantProvider.restaurants[index]
                                ["rating"],
                          ),
                        );
                      },
                    );
                  }),
            ),
            Text(
              'Items ',
              style: TextStyle(fontSize: 24.sp, fontWeight: FontWeight.w500),
            ),
            Container(
                child: FutureBuilder(
              future: itemsProvider.fetchItems(),
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
                  itemCount: itemsProvider.items.length,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () async {
                        await itemsProvider.getDocId(index);
                        String id = itemsProvider.DocId;
                          String image =
                            itemsProvider.items[index]["photoId"];
                        String name =
                            itemsProvider.items[index]["name"];
                        String price =
                            itemsProvider.items[index]["price"];
                        String description =
                            itemsProvider.items[index]["description"];
                                String DeleveryPrice =
                            itemsProvider.items[index]["deliveryPrice"];
                        itemsProvider.getPromos();
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) {
                            return Food_details(DOCID: id, description:description , image: image, name: name, price: price,DelPrice:DeleveryPrice);
                          },
                        ));
                      },
                      child: item_card(
                          rest_name: itemsProvider.items[index]["rest_name"],
                          item_name: itemsProvider.items[index]["name"],
                          item_photo: itemsProvider.items[index]["photoId"],
                          item_price: itemsProvider.items[index]["price"]),
                    );
                    ;
                  },
                );
              },
            )),
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
            style: TextStyle(
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
  CategoryContainer({
    Key? key,
    required this.ii,
  }) : super(key: key);

  final int ii;

  @override
  Widget build(BuildContext context) {
    return Consumer<Provider_Category>(
      builder: (context, Provider_Category, child) {
        return GestureDetector(
          onTap: () {
            Provider_Category.selectcategory(ii);
            Provider_Category.turnoff(ii);
          },
          child: Row(
            children: [
              AnimatedContainer(
                duration: Duration(milliseconds: 250),
                curve: Curves.slowMiddle,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Provider_Category.isselected[ii] ?? false
                        ? KPrimarycolor
                        : Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Provider_Category.isselected[ii] ?? false
                              ? KPrimarycolor.withOpacity(0.5)
                              : Colors.grey.withOpacity(0.2),
                          blurRadius: 10,
                          spreadRadius: 7)
                    ]),
                height: 150.h,
                width: MediaQuery.of(context).size.width * 0.205,
                alignment: Alignment.topCenter,
                child: Padding(
                  padding: EdgeInsets.all(8.0.r),
                  child: Column(
                    children: [
                      Container(
                        height: 70.r,
                        width: 70.r,
                        alignment: Alignment.center,
                        decoration: const BoxDecoration(
                            color: Colors.white, shape: BoxShape.circle),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 15.w,
                              top: 25.h,
                              child: Container(
                                height: 30.h,
                                width: 30.w,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(100),
                                    boxShadow: [
                                      BoxShadow(
                                          color: KPrimarycolor.withOpacity(0.4),
                                          blurRadius: 10.r,
                                          spreadRadius: 7.r,
                                          offset: Offset(2.w, 3.h))
                                    ]),
                              ),
                            ),
                            Container(
                              height: 70.h,
                              width: 70.w,
                              child: Image.asset(
                                mycategories[ii].image,
                                height: 40.h,
                                width: 40.w,
                                fit: BoxFit.contain,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text(
                        mycategories[ii].name,
                        style: TextStyle(
                            color: Provider_Category.isselected[ii] ?? false
                                ? Colors.white
                                : Colors.black),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
            ],
          ),
        );
      },
    );
  }
}

class Provider_Category extends ChangeNotifier {
  Map<int, bool> isselected = {
    0: false,
    1: false,
    2: false,
    3: false,
    4: false,
  };

  void selectcategory(int i) {
    isselected[i] = !isselected[i]!;

    notifyListeners();
  }

  void turnoff(int i) {
    for (int j = 0; j <= 4; j++) {
      if (j == i) {
        continue;
      } else {
        isselected[j] = false;
      }
    }
  }

  Map<int, bool> isitpressed = {
    0: true,
    1: false,
    2: false,
    3: false,
    4: false,
  };

  void selectpage(int i) {
    isitpressed[i] = true;

    notifyListeners();
  }

  void turnoffselectedpage(int i) {
    for (int j = 0; j <= 4; j++) {
      if (j == i) {
        continue;
      } else {
        isitpressed[j] = false;
      }
    }
  }
}
