import 'package:get_it/get_it.dart';
import 'package:mark_1/store/appstore.dart';

final di = GetIt.instance;

void setupStore() {
  di.registerLazySingleton<AppStore>(() => AppStore());
}
