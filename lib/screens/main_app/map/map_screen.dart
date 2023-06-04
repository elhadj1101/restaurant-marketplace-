  import 'package:flutter/foundation.dart';
  import 'package:flutter/material.dart';
  import 'package:flutter_screenutil/flutter_screenutil.dart';
  import 'package:geocoding/geocoding.dart';
  import 'package:geolocator/geolocator.dart';
  import 'package:google_maps_flutter/google_maps_flutter.dart';
  import 'package:provider/provider.dart';
  import 'package:restaurant_marketplace_h/constants.dart';
  import 'package:restaurant_marketplace_h/screens/starting_with_us/widgets/default_button.dart';

  import '../../../Providers/restaurant_provider.dart';

  class MapScreen extends StatefulWidget {
    @override
    _MapScreenState createState() => _MapScreenState();
  }

  class _MapScreenState extends State<MapScreen> {
    late GoogleMapController mapController;
    List<Marker> markers = [];
    late BitmapDescriptor customIcon;
    @override
    void initState() {
      super.initState();
      // addMarkers();
    }
    void _onMarkerTapped(MarkerId markerId,String rat,String src) {
      Marker selectedMarker =
          markers.firstWhere((marker) => marker.markerId == markerId);
      showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(top: Radius.circular(16.0))),
        context: context,
        isScrollControlled: true,
        builder: (BuildContext context) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                  selectedMarker.infoWindow.snippet.toString(),
                  style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w400,color: Klighttextcolor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  ClipOval(child: Image.network(src,fit: BoxFit.fill,height: 50.h,width: 50.w,)),
                  SizedBox(width: 10.w,),    
                  Text(
                  selectedMarker.infoWindow.title.toString(),
                  style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(width: 10.w,),
                      Text(rat),
                      const Icon(Icons.star,color: Colors.yellow,)
                    ],
                  ),
                  SizedBox(
                    height: 50.h,
                    width: 250.w,
                    child: ElevatedButton(
                      onPressed: () {},
                      style:  ElevatedButton.styleFrom(backgroundColor: KPrimarycolor,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),),
                      child: const Text(
                        "Go to Restaurant",
                        style: TextStyle(backgroundColor: KPrimarycolor),
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      );
    }

    Future<void> addMarkers() async {
      ImageConfiguration configuration = createLocalImageConfiguration(context);
      final RestaurantProvider1 = Provider.of<RestaurantProvider>(context);
    // Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List restaurants = RestaurantProvider1.restaurants;
      for (var element in restaurants) {
        List<Location> locations =
            await locationFromAddress(element["mapAddress"]);
        if (locations.isNotEmpty) {
          LatLng latLng =
              LatLng(locations.first.latitude, locations.first.longitude);
          Marker _marker = Marker(
            markerId: MarkerId(element["id"]),
            position: latLng,
            infoWindow: InfoWindow(
                title: element["name"], snippet: element["mapAddress"]),
            onTap: () {
              _onMarkerTapped(MarkerId(element["id"]),element["rating"].toString(),element["photoId"]);
            },
            // Additional marker properties like icon, info window, etc. can be set here
            icon: await BitmapDescriptor.fromAssetImage(configuration, 'assets/images/intro.png')
            
          );
          markers.add(_marker);
        }
      }
    }
    void _goToMyLocation() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied ||
          permission == LocationPermission.deniedForever) {
        // Handle denied permission
        return;
      }
    }
    Position position = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
mapController.animateCamera(
      CameraUpdate.newLatLngZoom(
        LatLng(position.latitude, position.longitude),
        15.0,
      ),
    );
    }
    @override
    Widget build(BuildContext context) {
      final RestaurantProvider1 = Provider.of<RestaurantProvider>(context);
      addMarkers();
      return Scaffold(
        body: FutureBuilder(
            future: RestaurantProvider1.fetchRestaurants(),
            builder: (context, snapshot) {
              return GoogleMap(
                onMapCreated: (GoogleMapController controller) {
                  mapController = controller;
                },
                padding: EdgeInsets.only(top:40.h),
                myLocationEnabled: true,
                myLocationButtonEnabled: true,
                markers: Set<Marker>.of(markers),
                initialCameraPosition:  const CameraPosition(
                  target: LatLng(28.0339, 1.6596), // Set the initial position of the map.
                  zoom: 6, // Set the initial zoom level of the map.
                ),
              );
            }),
            // floatingActionButton: Padding(
            //   padding:  EdgeInsets.only(left: 20.w,bottom: 20.h),
            //   child: Align(
            //     alignment: Alignment.bottomLeft,
            //     child: FloatingActionButton(onPressed: _goToMyLocation,
            //     child:  const Icon(Icons.my_location,color: Colors.white,),
            //     ),
            //   ),
            // ) ,
      );
    }
  }