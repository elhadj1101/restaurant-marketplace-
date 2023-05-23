import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:restaurant_marketplace_h/constants.dart';

class circleindicator extends StatelessWidget {
  const circleindicator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(

      body: Center(
        child: CircularProgressIndicator(

          color: KPrimarycolor,

        ),
      ),
    );
  }
}
