import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/Auth.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';
import 'package:restaurant_marketplace_h/screens/main_app/home_page/Home_screen.dart';

import '../../../Providers/restaurant_items_provider.dart';
import '../../../Providers/userProvider.dart';
import '../../../constants.dart';
import '../../starting_with_us/signUP/AddUser2Store.dart';
import '../../starting_with_us/widgets/default_button.dart';

class Add_new_adress extends StatefulWidget {
  const Add_new_adress({Key? key}) : super(key: key);

  @override
  State<Add_new_adress> createState() => _Add_new_adressState();
}

class _Add_new_adressState extends State<Add_new_adress> {
  final _numberController = TextEditingController();
  final _StreetController = TextEditingController();
  Future signUp() async {
    try {
      final userProvider = Provider.of<UserProvider>(context, listen: false);
      final providerAdress =
          Provider.of<Provider_adress>(context, listen: false);
      String _email = userProvider.email;
      String _fullName = userProvider.username;
      String _number = _numberController.text.trim();
      String _password = userProvider.password;
      String address = providerAdress.willaya +
          "-" +
          providerAdress.city +
          "-" +
          _StreetController.text.trim();
      if (FirebaseAuth.instance.currentUser == null) {
        final UserCredential userCredential =
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: _email,
          password: _password,
        );
      } 
      String uid =FirebaseAuth.instance.currentUser!.uid;
      AddUser(_fullName, _email, _number, uid, address).addUser();
      final itemProvider = Provider.of<ItemsProvider>(context ,listen: false);
     itemProvider.getPromos();
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Auth(),
      ));
    } catch (e) {
      String error = 'error';
      if (e is FirebaseAuthException) {
        if (e.code.contains('email-already-in-use')) {
          error = 'this email is alreay used ';
        } else {
          error = 'error';
        }
      }
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          behavior: SnackBarBehavior.floating,
          clipBehavior: Clip.none,
          margin: EdgeInsets.symmetric(
              horizontal: (error.length < 20) ? 40.w : 10.w, vertical: 20.h),
          content: Center(
              child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(
                Icons.error,
                color: Colors.white,
              ),
              SizedBox(
                width: 10.w,
              ),
              Text(
                '${error}',
                style: TextStyle(color: Colors.white),
              ),
            ],
          ))));
      // Handle the exception here

      // You can also throw the error to the calling code if needed
      throw e;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.fromLTRB(8.w,
                    0.21 * MediaQuery.of(context).size.height - 100, 8.w, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Address informations',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 23.sp,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.w, 40.h, 10.w, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 30.h, 0, 10.h),
                            child: Text(
                              'Mobile number',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: Klighttextcolor),
                            ),
                          ),
                          IntlPhoneField(
                            controller: _numberController,
                            showCountryFlag: true,
                            showDropdownIcon: true,
                            initialCountryCode: 'DZ',
                            cursorColor: KPrimarycolor,
                            disableLengthCheck: true,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(9),
                            ],
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              labelStyle: const TextStyle(
                                color: Klighttextcolor,
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              focusColor: KPrimarycolor,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  borderSide: BorderSide(
                                    color: KPrimarycolor,
                                    width: 2.w,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 30.h, 0, 10.h),
                            child: Text(
                              'State',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: Klighttextcolor),
                            ),
                          ),
                          Consumer<Provider_adress>(
                            builder: (context, Provider_adress, child) {
                              return CSCPicker(
                                onCountryChanged: (value) {},
                                onCityChanged: (value) {
                                  Provider_adress.Changecity(value ?? '');
                                },
                                onStateChanged: (value) {
                                  Provider_adress.Changewillaya(value ?? '');
                                },
                                countryFilter: const [
                                  CscCountry.Algeria,
                                ],
                                defaultCountry: CscCountry.Algeria,
                                dropdownDialogRadius: 20,
                              );
                            },
                          ),
                          Padding(
                            padding: EdgeInsets.fromLTRB(0, 30.h, 0, 10.h),
                            child: Text.rich(TextSpan(children: [
                              TextSpan(
                                text: 'Street  ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 18.sp,
                                    color: Klighttextcolor),
                              ),
                              TextSpan(
                                text: '( include house number ) ',
                                style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: 15.sp,
                                    color: Kverylighttextcolor),
                              )
                            ])),
                          ),
                          TextFormField(
                            controller: _StreetController,
                            cursorColor: KPrimarycolor,
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 25.w, vertical: 20.h),
                              suffixIconColor: Klighttextcolor,
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  gapPadding: 14.w,
                                  borderSide:
                                      const BorderSide(color: Colors.grey)),
                              focusColor: KPrimarycolor,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  gapPadding: 14.w,
                                  borderSide: BorderSide(
                                    color: KPrimarycolor,
                                    width: 2.w,
                                  )),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 40.0.w, vertical: 35.h),
                            child: default_button(
                                text: 'sign up',
                                x: 1.5,
                                y: 13,
                                button_color: KPrimarycolor,
                                function: signUp),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const BackButton_customized(),
        ],
      ),
    );
  }
}

class Provider_adress extends ChangeNotifier {
  String willaya = 'Alger';
  String city = 'Alger';
  String adress = '';

  void Changewillaya(String value) {
    willaya = value;

    notifyListeners();
  }

  void Changecity(String value) {
    city = value;
    notifyListeners();
  }

  void Changeadress(String value) {
    adress = value;
    notifyListeners();
  }
}
