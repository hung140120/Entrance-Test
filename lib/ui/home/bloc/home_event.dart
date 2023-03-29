import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_event.freezed.dart';

abstract class HomeEvent {
  const HomeEvent();
}

@freezed
class InitTrackingLocation extends HomeEvent with _$InitTrackingLocation {
  const factory InitTrackingLocation({
    required Function trackingLocationError,
  }) = _InitTrackingLocation;
}
