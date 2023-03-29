import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../model/user_location.dart';

part 'list_state.freezed.dart';

@freezed
class ListState with _$ListState {
  const factory ListState({
    @Default(<UserLocation>[]) List<UserLocation> userLocations,
  }) = _ListState;
}
