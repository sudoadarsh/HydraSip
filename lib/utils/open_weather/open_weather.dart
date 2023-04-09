import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:permission_handler/permission_handler.dart';

class OpenWeatherUtil {

  /// Request location permissions.
  static Future<PermissionStatus> requestPermission() async {
    return await Permission.location.request();
  }

  /// Determine the current position of the device.
  ///
  /// When the location services are not enabled or permissions
  /// are denied the `Future` will return an error.
  static Future<Position?> determinePosition() async {
    Position? position;
    try {
      position = await Geolocator.getCurrentPosition();
    } catch (E) {
      debugPrint("Error while getting the current location.");
    }
    return position;
  }
}