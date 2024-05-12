import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ecommerce/core/utils/error/failures.dart';
import 'package:ecommerce/feature/maps/data/model/place_details_model/place_details_model.dart';
import '../../../../feature/maps/data/model/place_autocomplete_model/place_autocomplete_model.dart';

class PlacesService {
  final String baseUrl = 'https://maps.googleapis.com/maps/api/place';
  final String apiKey = 'AIzaSyDtJecc6jbQFcHgFwU1IMSDUOkEAxx7gZY';
  Future<List<PlaceModel>> getPredictions(
      {required String input, required String sesstionToken}) async {
    var response = await http.get(Uri.parse(
        '$baseUrl/autocomplete/json?key=$apiKey&input=$input&sessiontoken=$sesstionToken'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['predictions'];
      List<PlaceModel> places = [];
      for (var item in data) {
        places.add(PlaceModel.fromJson(item));
      }
      return places;
    } else {
      return throw ErrorMessages.handleError("network_error");
    }
  }

  Future<PlaceDetailsModel> getPlaceDetails({required String placeId}) async {
    var response = await http
        .get(Uri.parse('$baseUrl/details/json?key=$apiKey&place_id=$placeId'));

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body)['result'];
      return PlaceDetailsModel.fromJson(data);
    } else {
      return throw ErrorMessages.handleError("network_error");
    }
  }
}
