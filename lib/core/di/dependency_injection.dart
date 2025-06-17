import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tafeel_task/core/services/networking/api_service.dart';
import 'package:tafeel_task/core/services/networking/dio_factory.dart';
import 'package:tafeel_task/view/users/data/repo/user_repo.dart';
import 'package:tafeel_task/view/users/logic/all_user_cubit.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // //Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
  getIt.registerLazySingleton<UsersRepo>(() => UsersRepo(getIt()));
  getIt.registerLazySingleton<AllUserCubit>(() => AllUserCubit(getIt()));
}
