import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';
import 'package:restaurant_marketplace_h/models/fakeDATA.dart';

class all_restaurant_card extends StatelessWidget {
  const all_restaurant_card({Key? key, required this.name, required this.image, required this.rating}) : super(key: key);
  final String name ;
  final String image ;
  final double rating ;

  @override
  Widget build(BuildContext context) {
    return  Stack(
      children:  [
         restaurant_widget(name:name , photoId: image ),
         review_widget(rating: rating,),
        Positioned(
            left: 220.w,
            top: 12.h,
            child:const  favorite_widget()
        ),
      ],
    );
  }
}

class restaurant_widget extends StatelessWidget {
  const restaurant_widget({Key? key, required this.name, required this.photoId}) : super(key: key);
  final String name ;

  final String photoId ;


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300.h,
      width: MediaQuery.of(context).size.width,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
              child: Image.network(photoId  , height: 150.h, width: 266.w, fit: BoxFit.cover,),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(20.w, 5, 0, 0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        name,
                        style: TextStyle(
                          fontSize: 17.sp,
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        width: 7.w,
                      ),
                       Icon(
                        Icons.check_circle,
                        color: const Color(0xFF029094),
                        size: 16.r,
                      ),
                    ],
                  ),
                   Text.rich(TextSpan(children: [
                    WidgetSpan(
                        child: Icon(
                          Icons.delivery_dining,
                          color: KPrimarycolor,
                          size: 20.r,
                        )),
                    const TextSpan(
                      text: ' free delivery  ',
                    ),
                     WidgetSpan(
                        child: Icon(
                          Icons.watch_later,
                          color: KPrimarycolor,
                          size: 16.r,
                        )),
                    const TextSpan(
                      text: ' 10 - 15 min',
                    ),
                  ])),
                  SizedBox(
                    height: 5.h,
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        height: 30.h,
                        width: 70.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text(
                          mytags[0].tag1, style: TextStyle(fontSize: 15.sp),),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Container(
                        height: 30.h,
                        width: 70.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text(
                          mytags[0].tag2, style: TextStyle(fontSize: 15.sp),),
                      ),
                      SizedBox(
                        width: 8.w,
                      ),
                      Container(
                        height: 30.h,
                        width: 70.w,
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(8)
                        ),
                        child: Text(
                          mytags[0].tag3 , style: TextStyle(fontSize: 15.sp),),
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
      ),
    );
  }
}


class review_widget extends StatelessWidget {
  const review_widget({Key? key, required this.rating}) : super(key: key);
  final double rating  ;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 15.w,
      top: 15.h,
      child: Container(
        alignment: Alignment.center,
        height: 30.h,
        width: 100.w,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.white,
        ),
        child: Text.rich(
            TextSpan(
                children: [
                  TextSpan(
                    text: '$rating ',
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 15.sp

                    ),
                  ),
                  const WidgetSpan(child: Icon(
                    Icons.star, color: Color(0xFFFFC529), size: 20,)),
                  TextSpan(
                    text: ' (+25) ',
                    style: TextStyle(

                        fontSize: 13.sp

                    ),
                  ),
                ]
            )
        ),
      ),
    );
  }
}

class favorite_widget extends StatelessWidget {
  const favorite_widget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<Provider_favorite>(builder: (context, Provider_favorite, child) {
      return  GestureDetector(
        onTap: () {
          Provider_favorite.make_favorite() ;


        },
        child: Container(
          height: 37.r,
          width: 37.r,
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
              color: Provider_favorite.isit_favorite ? KPrimarycolor : Colors.white ,
            ),
          ),
        ),
      ) ;
    },);
  }
}

class Provider_favorite extends ChangeNotifier {
  bool isit_favorite = false;

  void make_favorite() {
    isit_favorite = !isit_favorite;
    notifyListeners();
  }
}