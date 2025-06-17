import 'package:tafeel_task/core/services/networking/api_service.dart';
import 'package:tafeel_task/view/users/data/models/user_models.dart';
import 'package:tafeel_task/view/users/data/models/user_response_model.dart';

import '../../../../core/services/networking/api_error_handler.dart';
import '../../../../core/services/networking/api_result.dart';

class UsersRepo {
  final ApiService _apiService;

  UsersRepo(this._apiService);
  Future<ApiResult<UserResponseModel>> getAllUser({required int page}) async {
    Map<String, dynamic> queries = {'page': page};
    queries.removeWhere((key, value) => value == null);
    try {
      final response = await _apiService.getAllUsers(queries: queries);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  Future<ApiResult<UserModel?>> getSingleUsers({required String userId}) async {
    try {
      final response = await _apiService.getSingleUsers(userId: userId);
      return ApiResult.success(response.data);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
