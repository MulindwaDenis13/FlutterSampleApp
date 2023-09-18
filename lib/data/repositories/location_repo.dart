import 'package:ecommerce/data/api/api_client.dart';
import 'package:ecommerce/utils/app_constants.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocationRepo {
  final ApiClient apiClient;
  final SharedPreferences sharedPreferences;
  LocationRepo({
    required this.apiClient,
    required this.sharedPreferences,
  });

  Future<Response> getAddressfromGeocode(LatLng latLng) async {
    return await apiClient.get('${AppConstants.GET_GEOCODE_URL}'
        '?lat=${latLng.latitude}&lng=${latLng.longitude}');
  }
}
