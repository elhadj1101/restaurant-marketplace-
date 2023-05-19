import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:restaurant_marketplace_h/constants.dart';

class HomePage extends StatefulWidget {
const HomePage({Key? key}) : super(key: key);

@override
_HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
Completer<GoogleMapController> _controller = Completer();
// on below line we have specified camera position
static final CameraPosition _kGoogle = const CameraPosition(
	target: LatLng(28, 4),
	zoom: 14.4746,
);

// on below line we have created the list of markers
final List<Marker> _markers = <Marker>[
	const Marker(
		markerId: MarkerId('1'),
	position: LatLng(28, 3),
	infoWindow: InfoWindow(
		title: 'My Position',
	),
),
const Marker(
		markerId: MarkerId('2'),
	position: LatLng(28, 4),
	infoWindow: InfoWindow(
		title: 'position 2',
	),
),
];

// created method for getting user current location
Future<Position> getUserCurrentLocation() async {
	await Geolocator.requestPermission().then((value){
	}).onError((error, stackTrace) async {
	await Geolocator.requestPermission();
	print("ERROR"+error.toString());
	});
	return await Geolocator.getCurrentPosition();
}

@override
Widget build(BuildContext context) {
	return Scaffold(
	appBar: AppBar(
		backgroundColor: KPrimarycolor,
		// on below line we have given title of app
		title: const Text("Map"),
	),
	body: Container(
		child: SafeArea(
		// on below line creating google maps
		child: GoogleMap(
		// on below line setting camera position
		initialCameraPosition: _kGoogle,
		// on below line we are setting markers on the map
		markers: Set<Marker>.of(_markers),
		// on below line specifying map type.
		mapType: MapType.normal,
		// on below line setting user location enabled.
		myLocationEnabled: true,
		// on below line setting compass enabled.
		compassEnabled: true,
		// on below line specifying controller on map complete.
		onMapCreated: (GoogleMapController controller){
				_controller.complete(controller);
			},
		),
		),
	),
	// on pressing floating action button the camera will take to user current location
	// floatingActionButton: FloatingActionButton(
	// 	onPressed: () async{
	// 	getUserCurrentLocation().then((value) async {
	// 		print(value.latitude.toString() +" "+value.longitude.toString());

	// 		// marker added for current users location
	// 		_markers.add(
	// 			Marker(
	// 			markerId: MarkerId("2"),
	// 			position: LatLng(value.latitude, value.longitude),
	// 			infoWindow: InfoWindow(
	// 				title: 'My Current Location',
	// 			),
	// 			)
	// 		);

	// 		// specified current users location
	// 		CameraPosition cameraPosition = new CameraPosition(
	// 		target: LatLng(value.latitude, value.longitude),
	// 		zoom: 14,
	// 		);

	// 		final GoogleMapController controller = await _controller.future;
	// 		controller.animateCamera(CameraUpdate.newCameraPosition(cameraPosition));
	// 		setState(() {
	// 		});
	// 	});
	// 	},
	// 	child: Icon(Icons.local_activity),
	// ),
	);
}
}