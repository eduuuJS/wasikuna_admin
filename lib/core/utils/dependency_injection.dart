import 'package:get_it/get_it.dart';
import 'package:wasikuna_admin/core/network/dio_client.dart';

final sl = GetIt.I;

abstract class DependencyInjection {
  static void init() {
    sl.registerLazySingleton<DioClient>(() => DioClient());
  }
}
