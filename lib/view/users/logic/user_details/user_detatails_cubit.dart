import 'package:bloc/bloc.dart';
import 'package:tafeel_task/view/users/data/repo/user_repo.dart';
import 'package:tafeel_task/view/users/logic/user_details/user_detatails_state.dart';

class UserDetatailsCubit extends Cubit<UserDetatailsState> {
  final UsersRepo _usersRepo;
  UserDetatailsCubit(this._usersRepo) : super(UserDetatailsState.initial());
  Future<void> getUser(int userId) async {
    try {
      emit(UserDetatailsState.loading());
      final response = await _usersRepo.getSingleUsers(userId: userId.toString());
      response.when(
        success: (success) {
          if (success != null) {
            emit(UserDetatailsState.success(user: success));
          } else {
            emit(UserDetatailsState.error(error: "no data"));
          }
        },
        failure: (failure) {
          emit(UserDetatailsState.error(error: failure.message ?? ''));
        },
      );
    } catch (e) {
      emit(UserDetatailsState.error(error: "no data"));
    }
  }
}
