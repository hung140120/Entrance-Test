import 'package:freezed_annotation/freezed_annotation.dart';

part 'map_event.freezed.dart';

abstract class MapEvent {
  const MapEvent();
}

@freezed
class InitMapLocation extends MapEvent with _$InitMapLocation {
  const factory InitMapLocation() = _InitMapLocation;
}
