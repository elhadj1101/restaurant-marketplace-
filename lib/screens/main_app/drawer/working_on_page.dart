import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_marketplace_h/constants.dart';

class Working_on_it_page extends StatelessWidget {
  const Working_on_it_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: Center(
         child: Text(
           'Still working on it ',
           style: TextStyle(
             fontSize: 20.sp ,
             fontWeight: FontWeight.bold ,
             color: KPrimarycolor
           ),
         ),
       ),
    ) ;
  }
}
