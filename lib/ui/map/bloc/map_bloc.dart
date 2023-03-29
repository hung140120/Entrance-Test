import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../repository/user_location_repository.dart';
import 'map_event.dart';
import 'map_state.dart';

@Injectable()
class MapBloc extends Bloc<MapEvent, MapState> {
  MapBloc(this._userLocationRepository) : super(const MapState()) {
    on<InitMapLocation>(_onInitMapLocation);
  }

  final UserLocationRepository _userLocationRepository;

  void _onInitMapLocation(
    InitMapLocation event,
    Emitter<MapState> emit,
  ) async {
    await emit.forEach(
      _userLocationRepository.getAllUserLocationStream(),
      onData: (userLocations) {
        return state.copyWith(userLocations: userLocations);
      },
    );
  }
}
