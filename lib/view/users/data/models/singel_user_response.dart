import 'package:tafeel_task/view/users/data/models/user_models.dart';
import 'package:json_annotation/json_annotation.dart';

part 'singel_user_response.g.dart';

@JsonSerializable()
class SingelUserResponse {
  final UserModel? data;
  SingelUserResponse({this.data});
  factory SingelUserResponse.fromJson(Map<String, dynamic> json) => _$SingelUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SingelUserResponseToJson(this);
}
