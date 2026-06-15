import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getAssigneRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AssignRequestNotifier
//     extends StateNotifier<AsyncValue<GetAssignedRequestsModel>> {
//   final AuthService authService;

//   AssignRequestNotifier(this.authService) : super(const AsyncValue.loading()) {
//     getAssignRequests();
//   }

//   Future<void> getAssignRequests() async {
//     try {
//       state = const AsyncValue.loading();

//       final response = await authService.getAssignRequestList();

//       state = AsyncValue.data(response);
//     } catch (e, st) {
//       state = AsyncValue.error(e, st);
//     }
//   }
// }

// final getAssignRequestProvider =
//     StateNotifierProvider.autoDispose<
//       AssignRequestNotifier,
//       AsyncValue<GetAssignedRequestsModel>
//     >((ref) {
//       final authService = ref.read(authServiceProvider);

//       return AssignRequestNotifier(authService);
//     });

class AssignRequestNotifier
    extends StateNotifier<AsyncValue<GetAssignedRequestsModel>> {
  final AuthService authService;

  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;

  final List<ListElement> _fullList = [];

  AssignRequestNotifier(this.authService) : super(const AsyncLoading()) {
    getAssignRequests();
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreData => _hasMoreData;

  Future<void> getAssignRequests({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _hasMoreData = true;
        _fullList.clear();

        state = const AsyncLoading();
      }

      final response = await authService.getAssignRequestList(
        page: _currentPage,
      );

      final newList = response.data?.list ?? [];

      _fullList.addAll(newList);

      response.data?.list = List.from(_fullList);

      _hasMoreData = newList.isNotEmpty && newList.length >= 10;

      state = AsyncData(response);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> loadNextPage() async {
    if (_isLoadingMore || !_hasMoreData) return;

    try {
      _isLoadingMore = true;

      _currentPage++;

      final response = await authService.getAssignRequestList(
        page: _currentPage,
      );

      final newList = response.data?.list ?? [];

      if (newList.isEmpty) {
        _hasMoreData = false;
        return;
      }

      _fullList.addAll(newList);

      final updatedData = state.value!;

      updatedData.data?.list = List.from(_fullList);

      state = AsyncData(updatedData);

      if (newList.length < 10) {
        _hasMoreData = false;
      }
    } catch (e) {
      log("Pagination Error => $e");
    } finally {
      _isLoadingMore = false;
    }
  }
}

final getAssignRequestProvider =
    StateNotifierProvider.autoDispose<
      AssignRequestNotifier,
      AsyncValue<GetAssignedRequestsModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);

      return AssignRequestNotifier(authService);
    });
