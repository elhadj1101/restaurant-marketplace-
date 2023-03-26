import 'package:flutter/material.dart';


const KPrimarycolor = Color(0xFFFE724C);
const KLightcolor = Color(0xFFFFECE7);
const Ktextcolor = Colors.black;
const Klighttextcolor = Color(0xFF9796A1);
const Kverylighttextcolor = Color(0xFFC4C4C4);
final ButtonStyle Primarybuttonstyle = ElevatedButton.styleFrom(
    minimumSize: const Size(139.26, 54),
    shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30))),
    elevation: 10,
    backgroundColor: const Color(0XFFFFFFFF),
    foregroundColor: const Color(0xFF000000));
const welcometextstyle = TextStyle(
    fontWeight: FontWeight.w500,
    fontSize: 14,
    fontFamily: "sofiapro",
    color: Color(0xFF000000));