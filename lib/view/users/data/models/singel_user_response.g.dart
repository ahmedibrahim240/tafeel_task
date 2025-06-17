// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'singel_user_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SingelUserResponse _$SingelUserResponseFromJson(Map<String, dynamic> json) =>
    SingelUserResponse(
      data:
          json['data'] == null
              ? null
              : UserModel.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SingelUserResponseToJson(SingelUserResponse instance) =>
    <String, dynamic>{'data': instance.data};
