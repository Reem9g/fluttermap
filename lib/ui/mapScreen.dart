import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:flutter_app_mab/ui/services.dart';
import 'package:location/location.dart';

class map extends StatefulWidget {
  @override
  map_map_State createState() => map_map_State();
}

class map_map_State extends State<map> {
  Completer<GoogleMapController> _controller = Completer();
  Iterable markers = [];
  Iterable _markers = Iterable.generate(AppConstant.list.length, (index) {
    return Marker(
      markerId: MarkerId(AppConstant.list[index]['id']),
      position: LatLng(AppConstant.list[index]['lat'], AppConstant.list[index]['lon'],),
      infoWindow: InfoWindow(title: AppConstant.list[index]["title"]),
      icon: BitmapDescriptor.fromAsset("assets/Image/icons8_hospital.ico"),
    );
  }
  );
  @override
  void initState() {
    setState(() {
      markers = _markers;
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(target: LatLng(36.20131681847512, 37.13172031346219), zoom: 17),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set.from(markers),
        ),
      ),
    );
  }
}
class AppConstant {
static List<Map<String, dynamic>> list = [
  {"title": "مركز حلب الجديدة", "id": "1", "lat": 36.20061676098412, "lon": 37.130867856524134},
  {"title": "مركز الفرقان", "id": "2", "lat":  36.200131935863126, "lon":  37.132562993786145},
  {"title": "مركز الجميلية", "id": "3", "lat":  36.202937001577276, "lon":  37.132391356929574},
];
}