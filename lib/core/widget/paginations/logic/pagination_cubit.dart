import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

abstract class PaginationCubit<T> extends Cubit<PagingState<int, T>> {
  PaginationCubit() : super(PagingState()) {
    // Load first page immediately
    fetchNextPage();
  }

  Future<void> fetchNextPage() async {
    if (state.isLoading) return;

    emit(state.copyWith(isLoading: true, error: null));

    try {
      final newKey = (state.keys?.last ?? 0) + 1;
      final newItems = await fetchPage(newKey);
      final isLastPage = newItems.isEmpty;

      emit(
        state.copyWith(
          pages: [...?state.pages, newItems],
          keys: [...?state.keys, newKey],
          hasNextPage: !isLastPage,
          isLoading: false,
        ),
      );
    } catch (error) {
      emit(state.copyWith(error: error, isLoading: false));
    }
  }

  void refresh() {
    emit(PagingState()); // Reset to initial state
    fetchNextPage(); // Load first page again
  }

  void firstPageError(String error) {
    emit(state.copyWith(error: error, isLoading: false));
  }

  /// Abstract method to be implemented by concrete cubits
  Future<List<T>> fetchPage(int pageKey);
}
