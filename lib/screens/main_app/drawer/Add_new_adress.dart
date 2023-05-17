import 'package:country_state_city_picker/country_state_city_picker.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/screens/main_app/category/category_page.dart';

import '../../../constants.dart';
import '../../starting_with_us/widgets/default_button.dart';

class Add_new_adress extends StatelessWidget {
  const Add_new_adress({Key? key}) : super(key: key);

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
                      'Add new adress',
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 23.sp,
                          color: Colors.black),
                    ),
                    Padding(
                      padding: EdgeInsets.fromLTRB(10.w , 40.h , 10.w , 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding:  EdgeInsets.fromLTRB( 0 , 0 ,0 , 10.h ),
                            child: Text(
                              'Full name',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: Klighttextcolor),
                            ),
                          ),
                          TextFormField(
                            cursorColor: KPrimarycolor,
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                              suffixIconColor: Klighttextcolor,

                              enabledBorder: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(11),
                                  gapPadding: 14.w,
                                  borderSide: const BorderSide(color: Colors.grey )),
                              focusColor: KPrimarycolor,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  gapPadding: 14.w,
                                  borderSide:  BorderSide(
                                    color: KPrimarycolor,
                                    width: 2.w,
                                  )),
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.fromLTRB( 0 , 30.h , 0 ,  10.h ),
                            child: Text(
                              'Mobile number',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: Klighttextcolor),
                            ),
                          ),
                          IntlPhoneField(
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
                                  borderSide: const BorderSide(color: Colors.grey)),
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
                            padding:  EdgeInsets.fromLTRB( 0 , 30.h , 0 ,  10.h ),
                            child: Text(
                              'State',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  color: Klighttextcolor),
                            ),
                          ),
                          Consumer<Provider_adress>(builder: (context, Provider_adress, child) {
                            return CSCPicker(
                              onCountryChanged:(value) {
                              },
                              onCityChanged: (value) {
                                Provider_adress.Changecity(value?? '') ;
                              },
                              onStateChanged: (value) {
                                Provider_adress.Changewillaya(value?? '') ;
                              },
                              countryFilter:const  [
                                CscCountry.Algeria,
                              ],
                              defaultCountry: CscCountry.Algeria,
                              dropdownDialogRadius: 20,
                            );
                          },),
                          Padding(
                            padding:  EdgeInsets.fromLTRB( 0 , 30.h ,0 , 10.h ),
                            child: Text.rich(
                             TextSpan(
                               children: [
                                 TextSpan(
                                   text:  'Street  ',
                                   style: TextStyle(
                                       fontWeight: FontWeight.w400,
                                       fontSize: 18.sp,
                                       color: Klighttextcolor),
                                 ),
                                 TextSpan(
                                   text:  '( include house number ) ',
                                   style: TextStyle(
                                       fontWeight: FontWeight.w500,
                                       fontSize: 15.sp,
                                       color: Kverylighttextcolor),
                                 )
                               ]
                             )
                            ),
                          ),
                          TextFormField(
                            cursorColor: KPrimarycolor,
                            decoration: InputDecoration(
                              contentPadding:
                              EdgeInsets.symmetric(horizontal: 25.w, vertical: 20.h),
                              suffixIconColor: Klighttextcolor,

                              enabledBorder: OutlineInputBorder(

                                  borderRadius: BorderRadius.circular(11),
                                  gapPadding: 14.w,
                                  borderSide: const BorderSide(color: Colors.grey )),
                              focusColor: KPrimarycolor,
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(11),
                                  gapPadding: 14.w,
                                  borderSide:  BorderSide(
                                    color: KPrimarycolor,
                                    width: 2.w,
                                  )),
                            ),
                          ),

                          Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 40.0.w,vertical: 35.h),
                            child:const default_button(text: 'Save', x: 1.5, y: 13, button_color: KPrimarycolor),
                          ) ,


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
  String willaya = 'Alger' ;
  String city = 'Alger' ;
  String adress = '' ;

  void Changewillaya(String value){
    willaya = value ;
    notifyListeners();
  }
  void Changecity(String value){
    city = value ;
    notifyListeners();
  }
  void Changeadress(String value){
    adress = value ;
    notifyListeners();
  }

}