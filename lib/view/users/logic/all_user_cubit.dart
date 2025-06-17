import 'package:tafeel_task/core/widget/paginations/logic/pagination_cubit.dart';
import 'package:tafeel_task/view/users/data/models/user_models.dart';
import 'package:tafeel_task/view/users/data/repo/user_repo.dart';

class AllUserCubit extends PaginationCubit<UserModel> {
  final UsersRepo _usersRepo;
  AllUserCubit(this._usersRepo);
  @override
  Future<List<UserModel>> fetchPage(int pageKey) async {
    final response = await _usersRepo.getAllUser(page: pageKey);
    return response.when(
      success: (success) {
        return success.data;
      },
      failure: (failure) {
        firstPageError(failure.message ?? "");
        return [];
      },
    );
  }
}
