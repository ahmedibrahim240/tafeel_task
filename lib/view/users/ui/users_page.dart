import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tafeel_task/core/widget/cached_network_image.dart';
import 'package:tafeel_task/core/widget/paginations/ui/pagination_builder.dart';
import 'package:tafeel_task/view/users/data/models/user_models.dart';
import 'package:tafeel_task/view/users/logic/all_user_cubit.dart';
import 'package:tafeel_task/view/users/ui/user_details_page.dart';

class UsersPage extends StatelessWidget {
  const UsersPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.only(top: 24),
          child: PaginationBuilder<UserModel, AllUserCubit>(
            createCubit: context.read<AllUserCubit>(),
            itemBuilder: (_, user, index) {
              return ListTile(
                contentPadding: EdgeInsets.all(16),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (_) => UserDetailsPage(userId: user.id)));
                },
                title: Text(user.fullName),
                subtitle: Text(user.email),
                leading: CircleAvatar(radius: 25, child: CustomCachedNetworkImage(url: user.avatar)),
              );
            },
          ),
        ),
      ),
    );
  }
}
