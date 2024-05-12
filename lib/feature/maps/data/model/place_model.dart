import 'package:google_maps_flutter/google_maps_flutter.dart';
// ignore_for_file: public_member_api_docs, sort_constructors_first

class PlaceModel {
  final int id;
  final String name;
  final LatLng latLng;
  PlaceModel({
    required this.id,
    required this.name,
    required this.latLng,
  });
}

List<PlaceModel> place = [
  PlaceModel(
      id: 1,
      name: "ماهي للاجهزه الكهربية",
      latLng: const LatLng(29.835273466982155, 31.351666177236854)),
  PlaceModel(
      id: 2,
      name: "بيتزا فطائر كريب العميد",
      latLng: const LatLng(29.834807497989473, 31.346283406134162)),
  PlaceModel(
      id: 3,
      name: "مستشفى الهدى الإسلامي",
      latLng: const LatLng(29.8388465988675, 31.34145542977737)),
  PlaceModel(
      id: 4,
      name: "مسجد الروضه الشريفه بحلوان",
      latLng: const LatLng(29.831568653965874, 31.351368874563313)),
];
