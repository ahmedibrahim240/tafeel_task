import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // getIt.registerLazySingleton<ThemeCubit>(() => ThemeCubit());
  // getIt.registerFactory<OnboardingCubit>(() => OnboardingCubit());
  // //Dio & ApiService
  // Dio dio = DioFactory.getDio();
  // getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}
