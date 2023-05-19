import 'dart:io';
import 'dart:ui';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:restaurant_marketplace_h/widgets/default_button.dart';
import '../../../constants.dart';
import '../category/category_page.dart';

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Image.asset("assets/images/profile.png",
                width: MediaQuery.of(context).size.width, fit: BoxFit.cover),
            const BackButton_customized(),
            Padding(
              padding: EdgeInsets.only(right: 16.w, left: 16.w),
              child: Column(
                children: [
                  SizedBox(
                    height: 123.h,
                  ),
                  const profile_avatar(),
                  const SizedBox(
                    height: 19,
                  ),
                  RichText(
                      text: TextSpan(children: [
                    TextSpan(
                        text: "Name of the usr",
                        style: TextStyle(
                            color: Ktextcolor,
                            fontWeight: FontWeight.w700,
                            fontSize: 20.sp)),
                    TextSpan(
                        text: "\n           Edit profile",
                        style: TextStyle(
                            fontSize: 14.sp,
                            fontWeight: FontWeight.w700,
                            color: Kverylighttextcolor)),
                  ])),
                  SizedBox(
                    height: 90.h,
                  ),
                  TextFormField(
                  cursorColor: KPrimarycolor,
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    suffixIconColor: Klighttextcolor,
                    hintStyle: const TextStyle(
                  color: Kverylighttextcolor,
                    ),
                    labelText: 'Full name ',
                    labelStyle: const TextStyle(
                  color: Klighttextcolor,
                    ),
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 14.w,
                    borderSide:
                        const BorderSide(color: Kverylighttextcolor)),
                    focusColor: KPrimarycolor,
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 14.w,
                    borderSide: BorderSide(
                      color: KPrimarycolor,
                      width: 2.w,
                    )),
                  ),
                  ),
                  SizedBox(
                  height: 40.h,
                  ),
                  TextFormField(
                  cursorColor: KPrimarycolor,
                  onTap: () {},
                  decoration: InputDecoration(
                    suffixIconColor: Klighttextcolor,
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    hintStyle: const TextStyle(
                  color: Kverylighttextcolor,
                    ),
                    labelText: 'Email',
                    labelStyle: const TextStyle(
                  color: Klighttextcolor,
                    ),
                    enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 14.w,
                    borderSide:
                        const BorderSide(color: Kverylighttextcolor)),
                    focusColor: KPrimarycolor,
                    focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    gapPadding: 14.w,
                    borderSide: BorderSide(
                      color: KPrimarycolor,
                      width: 2.w,
                    )),
                  ),
                  ),
                  SizedBox(
                  height: 40.h,
                  ),
                  TextFormField(
                  cursorColor: KPrimarycolor,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    contentPadding:
                    EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                    suffixIconColor: Klighttextcolor,
                    hintStyle: const TextStyle(
                  color: Kverylighttextcolor,
                    ),
                    labelText: 'Phone Number',
                    labelStyle: const TextStyle(
                  color: Klighttextcolor,
                    ),
                    enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  gapPadding: 14.w,
                  borderSide: const BorderSide(color: Kverylighttextcolor),
                    ),
                    focusColor: KPrimarycolor,
                    focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20),
                  gapPadding: 14.w,
                  borderSide: BorderSide(
                    color: KPrimarycolor,
                    width: 2.w,
                  ),
                    ),
                  ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  const default_button(
                    text: "SAVE",
                    x: 2,
                    y: 15,
                    button_color: KPrimarycolor,
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

class profile_avatar extends StatefulWidget {
  const profile_avatar({super.key});

  @override
  State<profile_avatar> createState() => _profile_avatarState();
}

class _profile_avatarState extends State<profile_avatar> {
  late XFile _imagefile;
  final ImagePicker _picker = ImagePicker();
  Widget bottomsheet(ctx) {
    return Container(
      height: 100.h,
      width: MediaQuery.of(ctx).size.width,
      margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
      child: Column(
        children: [
          const Text(
            "Chosse a picture",
            style: TextStyle(fontSize: 20.0),
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton.icon(
                  onPressed: () => takePhoto(ImageSource.camera),
                  icon: const Icon(Icons.camera),
                  label: const Text("Camera"),
                  style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.black))),
              TextButton.icon(
                  onPressed: () => takePhoto(ImageSource.gallery),
                  icon: const Icon(Icons.image),
                  label: const Text("Gallery"),
                  style: const ButtonStyle(
                      foregroundColor: MaterialStatePropertyAll(Colors.black)))
            ],
          )
        ],
      ),
    );
  }
var profile_picture;
  void takePhoto(ImageSource source) async {
    final pickedfile = await _picker.pickImage(
      source: source,
    );
    setState(() {
      _imagefile = pickedfile!;
      profile_picture = (_imagefile == null)
        ? const AssetImage('assets/images/default_avatar.png')
        : FileImage(File(_imagefile.path)) as ImageProvider<Object>?;
    });
  }
// var profile_picture = (_imagefile == null)
//                   ? const AssetImage('assets/images/default_avatar.png')
//                   : FileImage(File(_imagefile.path)) as ImageProvider<Object>?;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 100.w,
            height: 100.h,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 7, color: Colors.white),
            ),
            child: GestureDetector(
              onTap: () => showDialog(context: context, builder: (BuildContext context){return BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 3.0,sigmaY: 3.0),
                child: AlertDialog(
                  shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                              contentPadding: EdgeInsets.zero,
                              content: SingleChildScrollView(
                                child: Container(
                                  width: 180.w,
                                  height: 310.h,
                                  decoration: BoxDecoration(
                                    image:  DecorationImage(
                                      image: profile_picture,
                                      fit: BoxFit.cover,
                                    ),
                                    borderRadius: BorderRadius.circular(10),
                                  ),)
              
                )),
              );}),
              child: CircleAvatar(
                radius: 48,
                 backgroundImage:profile_picture //imagefile == null
                //     ? const AssetImage('assets/images/default_avatar.png')
                //     : FileImage(File(_imagefile.path)) as ImageProvider<Object>?,
            
                // backgroundImage: _imagefile==null?  const AssetImage('assets/images/default_avatar.png') : FileImage(File(_imagefile.path)) ,
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: ((Builder) => bottomsheet(context)),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      side: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      ))),
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: const Icon(
                  Icons.camera_alt,
                  color: Colors.grey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
