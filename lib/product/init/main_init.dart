part of '../../main.dart';

final getIt = GetIt.instance;

void initInitializes() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
