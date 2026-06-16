import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getCompleteRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class CompleteRequestNotifier
//     extends StateNotifier<AsyncValue<GetCompleteRequestsModel>> {
//   final AuthService authService;

//   CompleteRequestNotifier(this.authService)
//     : super(const AsyncValue.loading()) {
//     getCompleteRequests();
//   }

//   Future<void> getCompleteRequests() async {
//     try {
//       state = const AsyncValue.loading();

//       final response = await authService.getCompleteRequestList();

//       state = AsyncValue.data(response);
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }

//   Future<void> refresh() async {
//     await getCompleteRequests();
//   }
// }

// final getCompleteRequestProvider =
//     StateNotifierProvider.autoDispose<
//       CompleteRequestNotifier,
//       AsyncValue<GetCompleteRequestsModel>
//     >((ref) {
//       final authService = ref.read(authServiceProvider);

//       return CompleteRequestNotifier(authService);
//     });




class CompleteRequestNotifier
    extends StateNotifier<AsyncValue<GetCompleteRequestsModel>> {
  final AuthService authService;

  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoadingMore = false;

  final List<ListElement> _fullList = [];

  CompleteRequestNotifier(this.authService)
    : super(const AsyncValue.loading()) {
    getCompleteRequests();
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreData => _currentPage < _totalPages;

  Future<void> getCompleteRequests({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _totalPages = 1;
        _fullList.clear();

        state = const AsyncValue.loading();
      }

      final response = await authService.getCompleteRequestList(
        page: _currentPage,
      );

      if (response.code == 0 && response.error == false) {
        _totalPages = response.data?.total ?? 1;
        final newList = response.data?.list ?? [];

        _fullList.addAll(newList);

        response.data?.list = _fullList;

        state = AsyncValue.data(response);
      } else {
        throw Exception(response.message);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> loadNextPage() async {
    if (_isLoadingMore || !hasMoreData) return;

    try {
      _isLoadingMore = true;
      _currentPage++;

      state = AsyncValue.data(state.value!);

      final response = await authService.getCompleteRequestList(
        page: _currentPage,
      );

      if (response.code == 0 && response.error == false) {
        final newList = response.data?.list ?? [];
        _fullList.addAll(newList);
        final updatedModel = state.value!;
        updatedModel.data?.list = _fullList;

        state = AsyncValue.data(updatedModel);
      }
    } catch (e, st) {
      log("Load more error: $e");
    } finally {
      _isLoadingMore = false;
      if (state.hasValue) {
        state = AsyncValue.data(state.value!);
      }
    }
  }
}

final getCompleteRequestProvider =
    StateNotifierProvider.autoDispose<
      CompleteRequestNotifier,
      AsyncValue<GetCompleteRequestsModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);
      return CompleteRequestNotifier(authService);
    });
