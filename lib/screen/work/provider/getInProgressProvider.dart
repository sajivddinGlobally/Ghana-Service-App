import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getAssigneRequestModel.dart'
    hide ListElement;
import 'package:dwelleasy_ghana/data/model/inProgressModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class InProgressRequestNotifier
//     extends StateNotifier<AsyncValue<InProgressModel>> {
//   final AuthService authService;

//   InProgressRequestNotifier(this.authService)
//     : super(const AsyncValue.loading()) {
//     getInProgressRequest();
//   }

//   Future<void> getInProgressRequest() async {
//     try {
//       state = const AsyncValue.loading();

//       final response = await authService.getInProgress();

//       state = AsyncValue.data(response);
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }
// }

// final getInProgressProvider =
//     StateNotifierProvider.autoDispose<
//       InProgressRequestNotifier,
//       AsyncValue<InProgressModel>
//     >((ref) {
//       final authService = ref.read(authServiceProvider);

//       return InProgressRequestNotifier(authService);
//     });

class InProgressRequestNotifier
    extends StateNotifier<AsyncValue<InProgressModel>> {
  final AuthService authService;

  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoadingMore = false;

  final List<ListElement> _fullList = [];

  InProgressRequestNotifier(this.authService)
    : super(const AsyncValue.loading()) {
    getInProgressRequest();
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreData => _currentPage < _totalPages;

  Future<void> getInProgressRequest({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _totalPages = 1;
        _fullList.clear();

        state = const AsyncValue.loading();
      }

      final response = await authService.getInProgress(page: _currentPage);

      if (response.code == 0 && response.error == false) {
        _totalPages = response.data?.totalPages ?? 1;
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

      final response = await authService.getInProgress(page: _currentPage);

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

final getInProgressProvider =
    StateNotifierProvider.autoDispose<
      InProgressRequestNotifier,
      AsyncValue<InProgressModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);
      return InProgressRequestNotifier(authService);
    });
