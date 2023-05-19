import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restaurant_marketplace_h/constants.dart';

class circular_rounded_Container extends StatefulWidget {
  @override
  State<circular_rounded_Container> createState() => _circular_rounded_ContainerState();
}

class _circular_rounded_ContainerState extends State<circular_rounded_Container> {
  Color container1Color = KLightcolor;
  Color container2Color = KLightcolor;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          container1Color= KPrimarycolor;
          container2Color = KLightcolor;
        });
        // Provider.of<ContainerState>(context, listen: false).changeColor();
      },
      child: Container(
        width: 323.w,
        height: 55.h,
        decoration: const BoxDecoration(
          shape: BoxShape.circle,
          color: KLightcolor,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
          container2Color= KPrimarycolor;
          container1Color = KLightcolor;
        });
                // Provider.of<ContainerState>(context, listen: false)
                //     .changeContainer2Color();
              },
              child: Container(
                  width: 160.w,
                  height: 47.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: container1Color,
                  ),
                ),
              ),
            GestureDetector(
              onTap: () => setState(() {
          container1Color= KPrimarycolor;
          container2Color = KLightcolor;
        }),
              child: Container(
                  width: 160.w,
                  height: 47.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: container2Color,
                  ),
                ),
            ),
          ],
        ),
      ),
    );
  }
}
