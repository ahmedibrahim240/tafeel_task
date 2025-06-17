import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeel_task/core/di/dependency_injection.dart';
import 'package:tafeel_task/core/widget/cached_network_image.dart';
import 'package:tafeel_task/core/widget/paginations/ui/pagination_default_wdiget.dart';
import 'package:tafeel_task/view/users/logic/user_details/user_detatails_cubit.dart';
import 'package:tafeel_task/view/users/logic/user_details/user_detatails_state.dart';

class UserDetailsPage extends StatelessWidget {
  final int userId;
  const UserDetailsPage({super.key, required this.userId});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UserDetatailsCubit(getIt())..getUser(userId),
      child: Scaffold(appBar: AppBar(), body: UserDetailsPageBody()),
    );
  }
}

class UserDetailsPageBody extends StatelessWidget {
  const UserDetailsPageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<UserDetatailsCubit, UserDetatailsState>(
      builder: (context, state) {
        return state.maybeWhen(
          loading: () => defaultLoadingWidget(),
          error: (error) => defaultEmptyWidget(context),
          success: (user) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomCachedNetworkImage(
                  height: MediaQuery.sizeOf(context).height * .35,
                  width: double.infinity,
                  url: user.avatar,
                  alignment: Alignment.topCenter,

                  borderRadius: 0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [Expanded(child: Text(user.fullName)), Expanded(child: Text(user.email))],
                ),
              ],
            );
          },
          orElse: () => SizedBox.shrink(),
        );
      },
    );
  }
}
