import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/user_location.dart';

part 'map_state.freezed.dart';

@freezed
class MapState with _$MapState {
  const factory MapState({
    @Default(<UserLocation>[]) List<UserLocation> userLocations,
  }) = _MapState;
}
