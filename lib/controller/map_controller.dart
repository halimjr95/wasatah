import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:wasata/model/map_model.dart';



class MapController extends GetxController {
  late GoogleMapController mapController;

  Set<Marker> markers = {
    Marker(
      markerId: MarkerId('myMarker1'),
      position: LatLng(24.685705, 46.785771),
      infoWindow: InfoWindow(
          title: 'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    ),
    Marker(
      markerId: MarkerId('myMarker2'),
      position: LatLng(24.746208, 46.682706),
      // onTap: (){
      //   Get.snackbar("Permission denied", 'No permisstion allowed',
      //       snackPosition: SnackPosition.TOP,
      //       duration: Duration(seconds: 4),
      //       margin: EdgeInsets.only(
      //           left: 20.0, right: 20.0, top: 30.0));
      // },

      infoWindow: InfoWindow(
          title: 'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    ),
    Marker(
      markerId: MarkerId('myMarker3'),
      position: LatLng(24.610191, 46.673793),
      infoWindow:
      InfoWindow(title: 'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت'),
      icon: BitmapDescriptor.defaultMarkerWithHue(
        BitmapDescriptor.hueViolet,
      ),
    ),
  };

  gotoLocation(double lat, double long) {
    mapController.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }


  void getCurrentPosition() async {
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      // await PermissionHandler()
      //     .requestPermissions([PermissionGroup.locationAlways]);
      print('permission denied');
      Get.snackbar("Permission denied", 'No permisstion allowed',
          snackPosition: SnackPosition.TOP,
          duration: Duration(seconds: 4),
          margin: EdgeInsets.only(
              left: 20.0, right: 20.0, top: 30.0));
    }
    else {
      Position currentPosition = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      // print(currentPosition.latitude);
      // print(currentPosition.longitude);
      gotoLocation(currentPosition.latitude, currentPosition.longitude);
      markers.add(Marker(
        markerId: MarkerId('myMarker4'),
        position: LatLng(currentPosition.latitude, currentPosition.longitude),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          BitmapDescriptor.hueViolet,
        )
        ));
      update();
      // Marker.addMarker(MarkerOptions(
      //   icon: BitmapDescriptor.fromAsset("assets/images/location_icon.png"),
      //   position: LatLng(40.017870, -105.278350),
      // ));
    }
  }

  List<MapModel> locations = [
    MapModel(
        image: 'assets/images/ads_1.png',
        title:
            'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
        price: '1,500,000 SAR',
        lat: 24.685705,
        long: 46.785771),
    MapModel(
        image: 'assets/images/ads_2.png',
        title: 'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
        price: '1,500,000 SAR',
        lat: 24.746208,
        long: 46.682706),
    MapModel(
        image: 'assets/images/ads_3.png',
        title: 'فلل منفصلة بتصميم كلاسيك بأبحر الشمالية حي الياقوت',
        price: '1,500,000 SAR',
        lat: 24.610191,
        long: 46.673793),
  ];


  bool? checkBox1 = false;
  bool? checkBox2 = false;
  bool? checkBox3 = false;
  bool? checkBox4 = false;
  bool? checkBox5 = false;
  bool? checkBox6 = false;
  bool? checkBox7 = false;
  bool? checkBox8 = false;
  bool? checkBox9 = false;
  bool? checkBox10 = false;

  void checkBoxesReset(){

    checkBox1 = false;
    checkBox2 = false;
    checkBox3 = false;
    checkBox4 = false;
    checkBox5 = false;
    checkBox6 = false;
    checkBox7 = false;
    checkBox8 = false;
    checkBox9 = false;
    checkBox10 = false;

    update();

  }



}
