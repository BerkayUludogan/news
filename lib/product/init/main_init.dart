part of '../../main.dart';

final getIt = GetIt.instance;

/// App initialize
void initInitializes() {
  getIt.registerSingleton<AppRouter>(AppRouter());
}
