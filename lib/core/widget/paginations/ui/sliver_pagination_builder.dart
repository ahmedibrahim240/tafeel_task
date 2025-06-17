import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

import '../logic/pagination_cubit.dart';
import 'pagination_default_wdiget.dart';

class SliverPaginationBuilder<T, C extends PaginationCubit<T>>
    extends StatelessWidget {
  final C createCubit;
  final Widget Function(BuildContext, T, int) itemBuilder;
  final Widget? emptyWidget;
  final Widget? loadingWidget;
  final Widget? errorWidget;
  final ScrollPhysics? physics;
  final bool shrinkWrap;

  const SliverPaginationBuilder({
    super.key,
    required this.createCubit,
    required this.itemBuilder,
    this.emptyWidget,
    this.loadingWidget,
    this.errorWidget,
    this.physics,
    this.shrinkWrap = false,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<C, PagingState<int, T>>(
      builder: (context, state) {
        final cubit = context.read<C>();

        return PagedSliverList<int, T>.separated(
          state: state,
          fetchNextPage: cubit.fetchNextPage,

          builderDelegate: PagedChildBuilderDelegate<T>(
            itemBuilder: itemBuilder,
            noItemsFoundIndicatorBuilder:
                (context) => emptyWidget ?? defaultEmptyWidget(context),
            firstPageProgressIndicatorBuilder:
                (context) => loadingWidget ?? defaultLoadingWidget(),
            newPageProgressIndicatorBuilder:
                (context) => loadingWidget ?? defaultLoadingWidget(),
            firstPageErrorIndicatorBuilder:
                (context) =>
                    errorWidget ??
                    defaultErrorWidget(
                      state.error,
                      () => cubit.refresh(),
                      context,
                    ),
          ),
          separatorBuilder: (context, index) => const SizedBox(),
        );
      },
    );
  }
}
