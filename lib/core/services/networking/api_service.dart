import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
import 'package:tafeel_task/view/users/data/models/singel_user_response.dart';
import 'package:tafeel_task/view/users/data/models/user_response_model.dart';

import 'api_constants.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;
  @GET(ApiConstants.userUrl)
  Future<UserResponseModel> getAllUsers({@Queries() required Map<String, dynamic> queries});
  @GET("${ApiConstants.userUrl}/{userId}")
  Future<SingelUserResponse> getSingleUsers({
    @Path() required String userId,
    @Queries() required Map<String, dynamic> queries,
  });
}
