import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getPendingRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final getPendingRequestProvider =
//     FutureProvider.autoDispose<GetPendingRequestsModel>((ref) async {
//       final pendingService = ref.read(authServiceProvider);
//       return await pendingService.getPendingRequestList();
//     });

class PendingRequestListnNotifier
    extends StateNotifier<AsyncValue<GetPendingRequestsModel>> {
  final AuthService authService;

  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoadingMore = false;

  final List<ListElement> _fullList = [];

  PendingRequestListnNotifier(this.authService)
    : super(const AsyncValue.loading()) {
    pendingReqeustList();
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreData => _currentPage < _totalPages;

  Future<void> pendingReqeustList({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _totalPages = 1;
        _fullList.clear();

        state = const AsyncValue.loading();
      }

      final response = await authService.getPendingRequestList(
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

      final response = await authService.getPendingRequestList(
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

final getPendingRequestProvider =
    StateNotifierProvider.autoDispose<
      PendingRequestListnNotifier,
      AsyncValue<GetPendingRequestsModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);
      return PendingRequestListnNotifier(authService);
    });
