import 'package:injectable/injectable.dart';
import 'package:objectbox/objectbox.dart';

import '../../model/user_location.dart';

@LazySingleton()
class AppDatabase {
  AppDatabase(this.store);

  final Store store;

  void addUserLocation(UserLocation userLocation) {
    store.box<UserLocation>().put(userLocation);
  }

  void removeUserLocation(int id) {
    store.box<UserLocation>().remove(id);
  }
  
  Stream<List<UserLocation>> getAllUserLocationStream() {
    final query = store.box<UserLocation>().query();
    return query
        .watch(triggerImmediately: true)
        .map<List<UserLocation>>((query) => query.find());
  }
}
