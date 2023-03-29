import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:geolocator/geolocator.dart';

import 'package:injectable/injectable.dart';

import '../exception/location_exception.dart';

@LazySingleton()
class LocationHelper {
  Future<Position> getCurrentPosition() => Geolocator.getCurrentPosition();
  Future<bool> openLocationSettings() => Geolocator.openLocationSettings();
  Future<bool> openAppSettings() => Geolocator.openAppSettings();

  Future<bool> requestPermissionLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw const LocationException(kind: LocationExceptionKind.gpsNotEnabled);
    }

    permission = await Geolocator.requestPermission();
    if (permission != LocationPermission.always) {
      permission = await Geolocator.requestPermission();
    }
    
    if (permission == LocationPermission.denied) {
      throw const LocationException(
          kind: LocationExceptionKind.locationPermissionDenied);
    }

    if (permission == LocationPermission.deniedForever) {
      throw const LocationException(
          kind: LocationExceptionKind.locationPermissionDeniedForever);
    }

    return true;
  }

  static LocationSettings getLocationSettings() {
    LocationSettings locationSettings;

    if (defaultTargetPlatform == TargetPlatform.android) {
      locationSettings = AndroidSettings(
          accuracy: LocationAccuracy.high,
          // distanceFilter: 100,
          forceLocationManager: true,
          intervalDuration: const Duration(seconds: 10),
          foregroundNotificationConfig: const ForegroundNotificationConfig(
            notificationText:
                "Example app will continue to receive your location even when you aren't using it",
            notificationTitle: "Running in Background",
            enableWakeLock: true,
          ));
    } else if (defaultTargetPlatform == TargetPlatform.iOS ||
        defaultTargetPlatform == TargetPlatform.macOS) {
      locationSettings = AppleSettings(
        accuracy: LocationAccuracy.high,
        activityType: ActivityType.fitness,
        // distanceFilter: 100,
        pauseLocationUpdatesAutomatically: true,
        // Only set to true if our app will be started up in the background.
        showBackgroundLocationIndicator: false,
      );
    } else {
      locationSettings = const LocationSettings(
        accuracy: LocationAccuracy.high,
        // distanceFilter: 100,
      );
    }

    return locationSettings;
  }

  Stream<Position> getLocation() {
    LocationSettings locationSettings = getLocationSettings();
    return Geolocator.getPositionStream(locationSettings: locationSettings);
  }
}
