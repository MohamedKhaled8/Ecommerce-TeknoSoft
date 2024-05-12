import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:ecommerce/core/utils/constant/color_manger.dart';
import 'package:ecommerce/core/utils/services/location_sevices.dart';

class GoogleMapScreen extends StatefulWidget {
  const GoogleMapScreen({super.key});

  @override
  State<GoogleMapScreen> createState() => _GoogleMapScreenState();
}

class _GoogleMapScreenState extends State<GoogleMapScreen> {
  late CameraPosition initialCameraPostion;

  late LocationService locationService;
  @override
  void initState() {
    initialCameraPostion = const CameraPosition(
        zoom: 17, target: LatLng(31.187084851056554, 29.928110526889437));
    locationService = LocationService();
    updateMyLocation();
    initPolylines();
    super.initState();
  }

  GoogleMapController? googleMapController;

  Set<Marker> markers = {
    const Marker(
        markerId: MarkerId('my_location_marker'),
        position: LatLng(29.83496493429851, 31.35196309999998)),
    const Marker(
        markerId: MarkerId('my_location_marker'),
        position: LatLng(29.83881789901295, 31.342028198469176)),
  };
  Set<Polyline> polyLines = {};
  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      markers: markers,
      zoomControlsEnabled: true,
      onMapCreated: (controller) {
        googleMapController = controller;
        // initMapStyle();
      },
      initialCameraPosition: initialCameraPostion,
      polylines: polyLines,
    );
  }

  Future<void> updateMyLocation() async {
    await locationService.checkAndRequestLocationService();
    bool hasPermission =
        await locationService.checkAndRequestLocationPermission();
    if (hasPermission) {
      locationService.getRealTimeLocationData((locationData) {
        if (locationData != null) {
          // setMyLocationMarker(locationData);
          setMyCameraPosition(locationData);
        } else {
          // Handle case where location data is null
        }
      });
    } else {
      // Handle case where permission is not granted
    }
  }

  void setMyCameraPosition(LocationData locationData) {
    var camerPosition = CameraPosition(
        target: LatLng(locationData.latitude!, locationData.longitude!),
        zoom: 15);

    googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(camerPosition));
  }

  // void setMyLocationMarker(LocationData locationData) {
  //   var myLocationMarker = Marker(
  //       markerId: const MarkerId('my_location_marker'),
  //       position: LatLng(locationData.latitude!, locationData.longitude!));

  //   markers.add(myLocationMarker);
  //   setState(() {});
  // }

  void initPolylines() {
    Polyline polyline = const Polyline(
      patterns: [PatternItem.dot],
      startCap: Cap.roundCap,
      color: ColorsManger.black,
      width: 5,
      polylineId: PolylineId("1"),
      points: [
        LatLng(29.83496493429851, 31.35196309999998),
        LatLng(29.83881789901295, 31.342028198469176),
      ],
    );

    polyLines.add(polyline);
  }
}


// inquire about location service
// request permission
// get location
// displays