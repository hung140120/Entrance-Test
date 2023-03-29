import 'package:entrance_test/repository/database/app_database.dart';
import 'package:injectable/injectable.dart';
import '../model/user_location.dart';

@LazySingleton()
class UserLocationRepository {
  UserLocationRepository(this.appDatabase);
  final AppDatabase appDatabase;

  void addUserLocation(UserLocation userLocation) {
    appDatabase.addUserLocation(userLocation);
  }

  void removeUserLocation(int id) {
    appDatabase.removeUserLocation(id);
  }

  Stream<List<UserLocation>> getAllUserLocationStream() {
    return appDatabase.getAllUserLocationStream();
  }
}
