class LocationException {
  const LocationException({
    required this.kind,
  });

  final LocationExceptionKind kind;
}

enum LocationExceptionKind {
  gpsNotEnabled,
  locationPermissionDenied,
  locationPermissionDeniedForever,
}