import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:tafeel_task/core/services/networking/api_service.dart';
import 'package:tafeel_task/core/services/networking/dio_factory.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // //Dio & ApiService
  Dio dio = DioFactory.getDio();
  getIt.registerLazySingleton<ApiService>(() => ApiService(dio));
}
