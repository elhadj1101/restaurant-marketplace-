import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/screens/starting_with_us/widgets/default_button.dart';
import '../../../Providers/userProvider.dart';
import '../../../constants.dart';
import '../category/category_page.dart';

class profile extends StatefulWidget {
  const profile({Key? key}) : super(key: key);

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);

    final _fullNameController =
        TextEditingController(text: userProvider.username);
    final _emailController = TextEditingController(text: userProvider.email);
    final _NumberController = TextEditingController(text: userProvider.phone);
    final username = _fullNameController.text.trim();
    final email = _emailController.text.trim();
    final phone = _NumberController.text.trim();

    return Scaffold(
      body: Stack(
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
                      text: userProvider.username,
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
                  height: 115.h,
                ),
                TextFormField(
                  controller: _fullNameController,
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
                  controller: _emailController,
                  cursorColor: KPrimarycolor,
                  onTap: () {
                    userProvider.updateDocument();
                  },
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
                  controller: _NumberController,
                  cursorColor: KPrimarycolor,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(10),
                  ],
                  decoration: InputDecoration(
                    hintText: phone,
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
                ElevatedButton(
                  onPressed: () {
                    userProvider.setUserData(username, email, phone);
                    if(userProvider.imageUploaded){
                    userProvider.updateDocument();
                    }
                  },
                  style: Primarybuttonstyle,
                  child: Text(
                    " save",
                    style: welcometextstyle,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class profile_avatar extends StatefulWidget {
  const profile_avatar({super.key});

  @override
  State<profile_avatar> createState() => profile_avatarState();
}

class profile_avatarState extends State<profile_avatar> {
// var profile_picture = (_imagefile == null)
//                   ? const AssetImage('assets/images/default_avatar.png')
//                   : FileImage(File(_imagefile.path)) as ImageProvider<Object>?;
  @override
  Widget build(BuildContext context) {
    final ImagePicker _picker = ImagePicker();
    XFile _imagefile;
    final userProvider = Provider.of<UserProvider>(context);
    void takePhoto(ImageSource source) async {
      final pickedfile = await _picker.pickImage(
        source: source,
      );
      setState(() {
        _imagefile = pickedfile!;
        userProvider.uploadImage(userProvider.UserID, _imagefile.path);
      });
    }

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
            child:CircleAvatar(
              radius: 50.r,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(50),
                child: (!userProvider.imageUploaded)? Image.asset('assets/images/default_avatar.png'):Image.network(userProvider.image)
                ),
              ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: () => showModalBottomSheet(
                  context: context,
                  builder: ((Builder) => Container(
                        height: 100.h,
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 20.h),
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
                                    onPressed: () =>
                                        takePhoto(ImageSource.camera),
                                    icon: const Icon(Icons.camera),
                                    label: const Text("Camera"),
                                    style: const ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black))),
                                TextButton.icon(
                                    onPressed: () =>
                                        takePhoto(ImageSource.gallery),
                                    icon: const Icon(Icons.image),
                                    label: const Text("Gallery"),
                                    style: const ButtonStyle(
                                        foregroundColor:
                                            MaterialStatePropertyAll(
                                                Colors.black)))
                              ],
                            )
                          ],
                        ),
                      )),
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
