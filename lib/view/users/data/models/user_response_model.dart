import 'package:json_annotation/json_annotation.dart';
import 'package:tafeel_task/view/users/data/models/user_models.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponseModel {
  final int page;
  @JsonKey(name: 'per_page')
  final int perPage;
  final int total;
  @JsonKey(name: 'total_pages')
  final int totalPages;
  final List<UserModel> data;

  UserResponseModel({
    required this.page,
    required this.perPage,
    required this.total,
    required this.totalPages,
    required this.data,
  });

  factory UserResponseModel.fromJson(Map<String, dynamic> json) => _$UserResponseModelFromJson(json);

  Map<String, dynamic> toJson() => _$UserResponseModelToJson(this);
}
