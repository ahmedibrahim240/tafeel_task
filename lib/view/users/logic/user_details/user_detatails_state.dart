import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tafeel_task/view/users/data/models/user_models.dart';

part 'user_detatails_state.freezed.dart';

@freezed
class UserDetatailsState with _$UserDetatailsState {
  const factory UserDetatailsState.initial() = _Initial;
  const factory UserDetatailsState.loading() = Loading;
  const factory UserDetatailsState.success({required UserModel user}) = Success;
  const factory UserDetatailsState.error({required String error}) = Error;
}
