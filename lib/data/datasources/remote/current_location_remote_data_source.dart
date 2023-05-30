import 'dart:convert';

import 'package:bwa_distribution_tracking/core/error/exceptions.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import '../../models/open_street_map/open_street_map_response.dart';

abstract class CurrentLocationRemoteDataSource {
  Future<Position> getCurrentLocation();
  // Future<Position> getCurrentLocation();
  Future<OpenStreetMapResponse> getCurrentAddress(double lat, double lon);
}

class CurrentLocationRemoteDataSourceImpl
    extends CurrentLocationRemoteDataSource {
  @override
  Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      await Geolocator.openLocationSettings();
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      // throw const LocationServiceDisabledException();
      // return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        throw const PermissionDeniedException(
            'Location permissions are denied');
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      // return Future.error(
      throw const PermissionDeniedException(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  @override
  Future<OpenStreetMapResponse> getCurrentAddress(
      double lat, double lon) async {
    print("lat: $lat");
    print("lon: $lon");
    var result =
        await http.get(Uri.http("nominatim.openstreetmap.org", "/reverse", {
      "format": "jsonv2",
      "lat": lat.toString(),
      "lon": lon.toString(),
    }));
    print("addres status code: ${result.statusCode}");
    print("addres response: ${result.body}");
    if (result.statusCode != 200) throw ServerException();
    return OpenStreetMapResponse.fromJson(jsonDecode(result.body));
  }
}
