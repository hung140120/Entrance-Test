import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import '../constants/constants.dart';
import 'di.config.dart';


import 'package:objectbox/objectbox.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../objectbox.g.dart' show getObjectBoxModel;

@module
abstract class ServiceModule {
  @preResolve
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();

  @preResolve
  Future<Store> getStore() async {
    final dir = await getApplicationDocumentsDirectory();

    return Store(getObjectBoxModel(), directory: '${dir.path}/${Constants.databaseName}');
  }
}

final GetIt getIt = GetIt.instance;

@injectableInit
Future<void> configureInjection() async => getIt.init();