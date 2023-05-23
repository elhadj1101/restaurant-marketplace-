import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';
import 'package:restaurant_marketplace_h/constants.dart';

import '../../../Providers/restaurant_provider.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  late GoogleMapController mapController;
  List<Marker> markers = [];
  
Marker marker = const Marker(
  markerId: MarkerId('marker1'),
  position: LatLng(28 , 3),
  infoWindow: InfoWindow(
    title: 'Marker Title',
    snippet: 'Marker Snippet',
  ),
);  void _onMarkerTapped(MarkerId markerId) {
    Marker selectedMarker = markers.firstWhere((marker) => marker.markerId == markerId);
    showModalBottomSheet(
      shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      side: BorderSide(
                        color: Colors.grey,
                        width: 2.0,
                      )),
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 300.h,
          child: Column(
            children: [
              Text(selectedMarker.infoWindow.title.toString()),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => RestaurantPage(selectedMarker.infoWindow.title.toString()), // Pass the restaurant info to the RestaurantPage.
                    ),
                  );
                },
                child: const Text('Go to Restaurant'),
              ),
            ],
          ),
        );
      },
    );
  }
Future<void> addMarkers() async {
  final RestaurantProvider1 = Provider.of<RestaurantProvider>(context);
  RestaurantProvider1.fetchRestaurants();
  List restaurants = RestaurantProvider1.restaurants;
  for (var element in restaurants) {
    List<Location> locations = await locationFromAddress(element["mapAddress"]) ;
    // print(" herrrrrrrrrrrrrrrrrrrrre $locations");
    if (locations.isNotEmpty) {
      LatLng latLng = LatLng(locations.first.latitude, locations.first.longitude);
      Marker _marker = Marker(
        markerId: MarkerId(element["id"]),
        position: latLng,
        infoWindow: InfoWindow(title:element["name"]),
        onTap: () {
          _onMarkerTapped(MarkerId(element["id"]));
        },
        // Additional marker properties like icon, info window, etc. can be set here
        icon: BitmapDescriptor.defaultMarker,
      );
        markers.add(_marker);
    }
  }
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Map Screen'),
      //   backgroundColor: KPrimarycolor,
      // ),
      body: FutureBuilder(
        future: addMarkers(),
        builder: (context,snapshot) {
        return GoogleMap (
          onMapCreated: (GoogleMapController controller)  {
            mapController = controller;
            mapController.showMarkerInfoWindow(MarkerId("hiiii"));
          },
          indoorViewEnabled:true,
          myLocationEnabled:true,
          markers: Set<Marker>.of(markers),
          initialCameraPosition:  CameraPosition(
            target: LatLng(28, 3), // Set the initial position of the map.
            zoom: 15.0, // Set the initial zoom level of the map.
          ),
        );}
      ),
    );
  }
}

class RestaurantPage extends StatelessWidget {
  final String restaurantInfo;

  RestaurantPage(this.restaurantInfo);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Restaurant Page'),
      ),
      body: Center(
        child: Text(restaurantInfo),
      ),
    );
  }
}
