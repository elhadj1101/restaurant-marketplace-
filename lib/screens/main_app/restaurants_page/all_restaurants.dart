import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';

import '../../../Providers/restaurant_provider.dart';
import '../home_page/restaurand_card.dart';

class all_restauratns extends StatefulWidget {
  const all_restauratns({super.key});

  @override
  State<all_restauratns> createState() => _all_restauratnsState();
}

class _all_restauratnsState extends State<all_restauratns> {
  final _wordController = TextEditingController();
   



  @override
  Widget build(BuildContext context) {

    final restaurantProvider = Provider.of<RestaurantProvider>(context);
   
    return Scaffold(
      body: GestureDetector(
        onTap: () =>      FocusScope.of(context).requestFocus( FocusNode()),
        child: Column(
          children: [
            Row(
              children: [
                const BackButton_customized(),
                SizedBox(width: 50.w,),
                Text("All Restaurants",style: TextStyle(color: Ktextcolor,fontSize: 18.sp,fontWeight: FontWeight.w400),)
              ],
            ),
            SizedBox(height: 10.h,),
               Padding(
                 padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
                 child: Row(
                             children: [
                  Expanded(
                    flex: 4,
                    child: TextFormField(
                      controller: _wordController,
                      cursorColor: KPrimarycolor,
                      decoration: InputDecoration(
                          // prefixIcon: Icon(
                          //   Icons.search,
                          //   size: 28.r,
                          //   color: Colors.black54,
                          // ),
                          hintText: 'Search with AI . . . ',
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
                    onTap: ()async{
                      await restaurantProvider.SearchRestaurents(_wordController.text.trim().toLowerCase());
                      print('zord  ; ' +_wordController.text);
                    },
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
                        child: Center(
                          child: Icon(
                              Icons.search,
                              size: 30.r,
                              color: KPrimarycolor,
                            ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                             ],
                           ),
               ),
            Expanded(
              child: ((_wordController.text.trim()=="")?
                ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 60.w),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: restaurantProvider.restaurants.length,
                      itemBuilder: (context, index) {
                        return restaurant_card(
                          name: restaurantProvider.restaurants[index]["name"],
                          image: restaurantProvider.restaurants[index]
                              ["photoId"],
                          rating: restaurantProvider.restaurants[index]
                              ["rating"],
                        );
                      },
                    ): ((restaurantProvider.AiRest.length==0)?
                         Text("there is no Restaurents") :ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 60.w),
                      shrinkWrap: true,
                      scrollDirection: Axis.vertical,
                      itemCount: restaurantProvider.AiRest.length,
                      itemBuilder: (context, index) {
                        return restaurant_card(
                          name: restaurantProvider.AiRest[index]["name"],
                          image: restaurantProvider.AiRest[index]
                              ["photoId"],
                          rating: restaurantProvider.AiRest[index]
                              ["rating"],
                        );
                      },
                    )
                    ))
           
            ),
          ],
        ),
      ),
    );
  }
}