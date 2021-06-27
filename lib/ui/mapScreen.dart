import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

//aya2

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
      icon: BitmapDescriptor.fromAsset(AppConstant.list[index]['img']),
    );
  },

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
    return  Scaffold(
        body: GoogleMap(
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(target: LatLng(36.20131681847512, 37.13172031346219), zoom: 15),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set.from(markers),
        ),
      )
    ;
  }
}
class AppConstant {
static List<Map<String, dynamic>> list = [
  {"title": "مركز حلب الجديدة", "id": "1", "lat": 36.20314478553057, "lon":  37.131468656146595, "img": "assets/Image/icons8_clinic_64.png" },
  {"title": "مركز الفرقان", "id": "2", "lat":  36.202434836850266, "lon":  37.13425820018407,"img": "assets/Image/icons8_clinic_64.png" },
  {"title": "مركز المرديان", "id": "3", "lat":  36.20146517469391, "lon":  37.12887227549016,"img": "assets/Image/icons8_clinic_64.png" },
  {"title": "مركز بستان القصر", "id": "4", "lat":  36.20056481820934,"lon":  37.13138283665096,"img": "assets/Image/icons8_clinic_64.png" },
  {"title": "مركز الشهباء", "id": "5", "lat":  36.20040897133898, "lon":  37.132391356929574,"img": "assets/Image/icons8_clinic_64.png" },
  {"title": "مركز الشعار", "id": "6", "lat":  36.201534401528406, "lon":   37.13586750846024,"img": "assets/Image/icons8_clinic_64.png" },

  {"title": "مخبر حلب الجديدة", "id": "7", "lat":  36.19957785074895, "lon":37.131447213136006,"img": "assets/Image/bloodmap.ico" },
  {"title": "مخبر حلب الجديدة", "id": "7", "lat":  36.19846966775864, "lon":37.1330135739677,"img": "assets/Image/bloodmap.ico" },

  {"title": "صيدلية حلب الجديدة", "id": "7", "lat":  36.203335151575565, "lon":37.126661989595526,"img": "assets/Image/pharmacymap.ico" },
  {"title": "صيدلية الجميلية", "id": "7", "lat":  36.20506670605941, "lon":37.136361259707485,"img": "assets/Image/pharmacymap.ico"},
  {"title": "صيدلية النيرب", "id": "7", "lat":  36.20456463708928, "lon":37.132391370629804,"img": "assets/Image/pharmacymap.ico" },

  {"title": "دكتورة روان", "id": "7", "lat": 36.20122235565245, "lon":37.12149071433444,"img": "assets/Image/doctormsap.ico" },
  {"title": "دكتورة ريم", "id": "7", "lat":  36.19749986380102, "lon": 37.12604010962752,"img": "assets/Image/doctormsap.ico" },
  {"title": "دكتورة آية", "id": "7", "lat":  36.199491005068225, "lon": 37.123937133488,"img": "assets/Image/doctormsap.ico" },












];
}