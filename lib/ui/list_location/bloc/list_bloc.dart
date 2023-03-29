import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import '../../../repository/user_location_repository.dart';
import 'list_event.dart';
import 'list_state.dart';

@Injectable()
class ListBloc extends Bloc<ListEvent, ListState> {
  ListBloc(this._userLocationRepository) : super(const ListState()) {
    on<InitListLocation>(
      _onInitListLocation,
    );
  }

  final UserLocationRepository _userLocationRepository;

  Future<void> _onInitListLocation(
    InitListLocation event,
    Emitter<ListState> emit,
  ) async {
    await emit.forEach(
      _userLocationRepository.getAllUserLocationStream(),
      onData: (userLocations) => state.copyWith(userLocations: userLocations),
    );
  }
}
