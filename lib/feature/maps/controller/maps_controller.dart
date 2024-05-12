// import 'dart:async';
// import 'package:uuid/uuid.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get_state_manager/get_state_manager.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'package:ecommerce/core/utils/services/location_sevices.dart';
// import '../data/model/place_autocomplete_model/place_autocomplete_model.dart';
// import 'package:ecommerce/core/utils/services/google_maps_sevices/map_services.dart';
// import 'package:ecommerce/feature/maps/data/model/place_details_model/place_details_model.dart';

// abstract class MapsController extends GetxController {
//   void updateCurrentLocation();

//   void fetchPredictions();
// }

// class MapsControllerImp extends MapsController {
//   late CameraPosition initalCameraPoistion;

//   late MapServices mapServices;
//   late TextEditingController textEditingController;
//   late GoogleMapController googleMapController;
//   String? sesstionToken;
//   late Uuid uuid;
//   Set<Marker> markers = {};

//   List<PlaceAutoCompleateModel> places = [];
//   Set<Polyline> polyLines = {};

//   late LatLng desintation;

//   Timer? debounce;

//   @override
//   void onInit() {
//     mapServices = MapServices();
//     uuid = const Uuid();
//     textEditingController = TextEditingController();
//     initalCameraPoistion = const CameraPosition(target: LatLng(0, 0));
//     fetchPredictions();
//     super.onInit();
//   }

//   @override
//   void fetchPredictions() {
//     textEditingController.addListener(() {
//       if (debounce?.isActive ?? false) {
//         debounce?.cancel();
//       }
//       debounce = Timer(const Duration(milliseconds: 100), () async {
//         sesstionToken ??= uuid.v4();
//         await mapServices.getPredictions(
//             input: textEditingController.text,
//             sesstionToken: sesstionToken!,
//             places: places);
//         update();
//       });
//     });
//      update();
//   }

//   @override
//   void updateCurrentLocation() async {
//     try {
//       mapServices.updateCurrentLocation(onUpdatecurrentLocation: () {
//         update();
//       } , 
      
//       googleMapController: googleMapController,
//       markers: markers
      
//       );
//       update();
//     } on LocationServiceException catch (e) {
//       // Handle location service exception
//     } on LocationPermissionException catch (e) {
//       // Handle location permission exception
//     } catch (e) {
//       // Handle other exceptions
//     }
//      update();
//   }

//   Future<void> onPlaceSelecte(PlaceDetailsModel placeDetailsModel) async {
//     update();
//     places.clear();

//     sesstionToken = null;
//     update();
//     desintation = LatLng(placeDetailsModel.geometry!.location!.lat!,
//         placeDetailsModel.geometry!.location!.lng!);

//     var points = await mapServices.getRouteData(desintation: desintation);
//     mapServices.displayRoute(points,
//         polyLines: polyLines, googleMapController: googleMapController);
//     update();
//   }

//   @override
//   void dispose() {
//     textEditingController.dispose();
//     debounce?.cancel();
//     super.dispose();
//   }
// }
