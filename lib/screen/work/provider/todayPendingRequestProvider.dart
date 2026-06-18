import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/todayPendngRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class TodayPendingRequestNotifier
//     extends StateNotifier<AsyncValue<TodayPendingRequestModel>> {
//   final AuthService authService;

//   TodayPendingRequestNotifier(this.authService)
//     : super(const AsyncValue.loading()) {
//     getPendingRequest();
//   }

//   Future<void> getPendingRequest() async {
//     try {
//       state = const AsyncValue.loading();

//       final response = await authService.todayPendingRequest();

//       state = AsyncValue.data(response);
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }
// }

// final todayPendingRequestProvider =
//     StateNotifierProvider.autoDispose<
//       TodayPendingRequestNotifier,
//       AsyncValue<TodayPendingRequestModel>
//     >((ref) {
//       final authService = ref.read(authServiceProvider);

//       return TodayPendingRequestNotifier(authService);
//     });

class TodayPendingRequestNotifier
    extends StateNotifier<AsyncValue<TodayPendingRequestModel>> {
  final AuthService authService;

  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoadingMore = false;

  final List<ListElement> _fullList = [];

  TodayPendingRequestNotifier(this.authService)
    : super(const AsyncValue.loading()) {
    getPendingRequest();
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreData => _currentPage < _totalPages;

  // Future<void> getPendingRequest({bool isRefresh = false}) async {
  //   try {
  //     if (isRefresh) {
  //       _currentPage = 1;
  //       _totalPages = 1;
  //       _fullList.clear();

  //       state = const AsyncValue.loading();
  //     }

  //     final response = await authService.todayPendingRequest(
  //       page: _currentPage,
  //     );

  //     if (response.code == 0 && response.error == false) {
  //       _totalPages = response.data?.totalPages ?? 1;
  //       final newList = response.data?.list ?? [];

  //       _fullList.addAll(newList);

  //       response.data?.list = _fullList;

  //       state = AsyncValue.data(response);
  //     } else {
  //       throw Exception(response.message);
  //     }
  //   } catch (e, st) {
  //     state = AsyncValue.error(e, st);
  //   }
  // }
  Future<void> getPendingRequest({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _totalPages = 1;
        _fullList.clear();

        state = const AsyncValue.loading();
      }

      final response = await authService.todayPendingRequest(
        page: _currentPage,
      );

      if (response.code == 0 && response.error == false) {
        _totalPages = response.data?.totalPages ?? 1;

        final newList = response.data?.list ?? [];

        if (_currentPage == 1) {
          _fullList.clear();
        }

        _fullList.addAll(newList);

        response.data?.list = List<ListElement>.from(_fullList);

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

      final response = await authService.todayPendingRequest(
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

final todayPendingRequestProvider =
    StateNotifierProvider.autoDispose<
      TodayPendingRequestNotifier,
      AsyncValue<TodayPendingRequestModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);
      return TodayPendingRequestNotifier(authService);
    });
