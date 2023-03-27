import 'package:flutter/material.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/verivication_code_page/verification_code_page_contents.dart';
import '../../../constants.dart';
import '../../../widgets/circle_container.dart';

class Verification_Code_page extends StatelessWidget {
  const Verification_Code_page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(children: const [
        // -110 , 300
        Circle_Container(
            Container_color: KPrimarycolor,
            top_change: -110,
            left_change: 300,
            container_height: 150,
            container_width: 150),
        Circle_Container(
            Container_color: KPrimarycolor,
            top_change: -120,
            left_change: -75,
            container_height: 150,
            container_width: 150),
        Circle_Container(
            Container_color: Colors.white,
            top_change: -74,
            left_change: -35,
            container_height: 80,
            container_width: 80),

        Circle_Container(
            Container_color: KLightcolor,
            top_change: -140,
            left_change: 30,
            container_height: 150,
            container_width: 150),
        Verification_Code_page_contents() ,
      ]),
    );
  }
}
