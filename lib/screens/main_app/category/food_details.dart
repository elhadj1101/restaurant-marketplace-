import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/models/fakeDATA.dart';
import 'package:restaurant_marketplace_h/screens/main_app/Add_to_cart.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/restaurand_card.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/widgets/default_button.dart';

import '../../../Providers/restaurant_items_provider.dart';
import '../../../constants.dart';
import '../home_page/item_card.dart';

class Food_details extends StatelessWidget {
  Food_details(
      {Key? key,
      required this.DOCID,
      required this.name,
      required this.price,
      required this.description,
      required this.image, required this.DelPrice})
      : super(key: key);
  final String DOCID;
  final String name;
  final String price;
  final String DelPrice;
  final String description;
  final String image;
  @override
  Widget build(BuildContext context) {
     final itemsProvider = Provider.of<ItemsProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(20.w, 15.h, 20.w, 0),
            child: ListView(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Stack(
                      children: [
                       Image.network(
                                image,
                                height: 225.h,
                                width: 355.w,
                                fit: BoxFit.cover,
                              ),
                        Positioned(
                            left: 310.w,
                            top: 10.h,
                            child: const favorite_widget3())
                      ],
                    )),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  name,
                  style: TextStyle(
                    fontSize: 30.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '${price} Da',
                      style: TextStyle(
                          fontSize: 26.sp,
                          color: KPrimarycolor,
                          fontWeight: FontWeight.w600),
                    ),
                    Consumer<Provider_numberofitems>(
                      builder: (context, Provider_numberofitems, child) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            const Add_container(
                              size: 38,
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
                            const Add_container(isitadd: true, size: 38),
                          ],
                        );
                      },
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  description,
                  style: TextStyle(
                      fontSize: 15.sp, color: const Color(0xFF858992)),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  'choice to add on',
                  style: TextStyle(
                      fontSize: 22.sp,
                      color: Colors.black87,
                      fontWeight: FontWeight.w600),
                ),
                additionrow(
                  image: myadditions[0].photo_id,
                  name: myadditions[0].name,
                  value1: 1,
                ),
                additionrow(
                  image: myadditions[1].photo_id,
                  name: myadditions[1].name,
                  value1: 2,
                ),
                additionrow(
                  image: myadditions[2].photo_id,
                  name: myadditions[2].name,
                  value1: 3,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 75.w),
                  child: ElevatedButton(
                      onPressed: () async{
                        await itemsProvider.getDataFronID(DOCID);
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => Add_to_cart(DOCID: DOCID, image: image, name: name, price: price,DelPrice:DelPrice
                            
                          ),
                        ));
                      },
                      style: ElevatedButton.styleFrom(
                          fixedSize: Size(50.w, 60.h),
                          elevation: 10,
                          backgroundColor: KPrimarycolor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(50))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 40.r,
                            width: 40.r,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(300)),
                              color: Colors.white,
                            ),
                            child: Icon(
                              Icons.shopping_bag,
                              size: 25.r,
                              color: KPrimarycolor,
                            ),
                          ),
                          SizedBox(
                            width: 10.w,
                          ),
                          Text(
                            'Add to cart',
                            style:
                                TextStyle(fontSize: 21.sp, color: Colors.white),
                          ),
                        ],
                      )),
                ),
                SizedBox(
                  height: 30.h,
                )
              ],
            ),
          ),
          Padding(
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
          ),
        ],
      ),
    );
  }
}

class Provider_numberofitems extends ChangeNotifier {
  int num = 1;

  bool isitpressedadd = true;

  bool isitpressedminus = false;

  void initnum() {
    if (num <= 1) {
      num = 1;
    }
  }

  void additem() {
    num++;
    notifyListeners();
  }

  void minusitem() {
    num--;
    notifyListeners();
  }

  void pressadd() {
    isitpressedadd = true;
    isitpressedminus = false;
    notifyListeners();
  }

  void pressminus() {
    isitpressedminus = true;
    isitpressedadd = false;
    notifyListeners();
  }
}

class Add_container extends StatelessWidget {
  const Add_container({
    Key? key,
    required this.isitadd,
    required this.size,
  }) : super(key: key);
  final bool isitadd;
  final int size;

  @override
  Widget build(BuildContext context) {
    return Consumer<Provider_numberofitems>(
      builder: (context, Provider_numberofitems, child) {
        return GestureDetector(
          onTap: () {
            isitadd
                ? Provider_numberofitems.additem()
                : Provider_numberofitems.minusitem();
            Provider_numberofitems.initnum();
            isitadd
                ? Provider_numberofitems.pressadd()
                : Provider_numberofitems.pressminus();
          },
          child: Container(
            height: size.r,
            width: size.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(300),
              color: isitadd
                  ? Provider_numberofitems.isitpressedadd
                      ? KPrimarycolor
                      : Colors.white
                  : Provider_numberofitems.isitpressedminus
                      ? KPrimarycolor
                      : Colors.white,
              border: Border.all(width: 2, color: KPrimarycolor),
            ),
            child: Icon(
              isitadd ? Icons.add : Icons.remove,
              color: isitadd
                  ? Provider_numberofitems.isitpressedadd
                      ? Colors.white
                      : KPrimarycolor
                  : Provider_numberofitems.isitpressedminus
                      ? Colors.white
                      : KPrimarycolor,
            ),
          ),
        );
      },
    );
  }
}

class additionrow extends StatefulWidget {
  const additionrow(
      {Key? key,
      required this.image,
      required this.name,
      required this.value1})
      : super(key: key);
  final String image;


  final String name;
  final int value1;

  @override
  State<additionrow> createState() => _additionrowState();
}

class _additionrowState extends State<additionrow> {
  bool isitpressed = false;
  int? group = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Padding(
          padding: EdgeInsets.fromLTRB(8.0.w, 0, 8.w, 0),
          child: Row(
            children: [
              Image.asset(
                widget.image,
                height: 40.r,
                width: 40.r,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                widget.name,
                style: TextStyle(
                  fontSize: 16.sp,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
        Consumer<Provider_numberofitems>(
          builder: (context, Provider_numberofitems, child) {
            return Stack(
              alignment: Alignment.center,
              children: [
                Radio(
                  value: widget.value1,
                  groupValue: group,
                  onChanged: (value) {
                    if (value != group) {
                      setState(() {
                        group = value;
                        isitpressed = true;
                      });
                    }
                  },
                  activeColor: KPrimarycolor,
                ),
                if (isitpressed)
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        group = 0;
                        isitpressed = false;
                      });
                    },
                    child: Container(
                      height: 20.h,
                      width: 20.w,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(300),
                          color: Colors.transparent),
                    ),
                  ),
              ],
            );
          },
        ),
      ],
    );
  }
}
