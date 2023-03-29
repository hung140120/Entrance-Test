import 'package:bloc/bloc.dart';
import 'package:entrance_test/repository/user_location_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../helpers/location_helper.dart';
import '../../../model/user_location.dart';
import 'home_event.dart';
import 'home_state.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc(this._userLocationRepository, this._locationHelper)
      : super(const HomeState()) {
    on<InitTrackingLocation>(_onInitTrackingLocation);
  }

  final UserLocationRepository _userLocationRepository;
  final LocationHelper _locationHelper;

  void _onInitTrackingLocation(
    InitTrackingLocation event,
    Emitter<HomeState> emit,
  ) {
    _locationHelper.requestPermissionLocation().then<void>((value) {
      if (value) {
        saveLocation();
      }
    }).catchError((e) => event.trackingLocationError.call(e));
  }

  void saveLocation() async {
    _locationHelper.getLocation().listen((event) async {
      final userLocation =
          UserLocation(latitude: event.latitude, longitude: event.longitude);
      _userLocationRepository.addUserLocation(userLocation);
    });
  }
}
