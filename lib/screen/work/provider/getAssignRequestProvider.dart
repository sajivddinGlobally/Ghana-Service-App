import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getAssigneRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// class AssignRequestNotifier
//     extends StateNotifier<AsyncValue<GetAssignedRequestsModel>> {
//   final AuthService authService;

//   int _currentPage = 1;
//   bool _isLoadingMore = false;
//   bool _hasMoreData = true;

//   final List<ListElement> _fullList = [];

//   AssignRequestNotifier(this.authService) : super(const AsyncLoading()) {
//     getAssignRequests();
//   }

//   bool get isLoadingMore => _isLoadingMore;
//   bool get hasMoreData => _hasMoreData;

//   Future<void> getAssignRequests({bool isRefresh = false}) async {
//     try {
//       if (isRefresh) {
//         _currentPage = 1;
//         _hasMoreData = true;
//         _fullList.clear();

//         state = const AsyncLoading();
//       }

//       final response = await authService.getAssignRequestList(
//         page: _currentPage,
//       );

//       final newList = response.data?.list ?? [];

//       _fullList.addAll(newList);

//       response.data?.list = List.from(_fullList);

//       _hasMoreData = newList.isNotEmpty && newList.length >= 10;

//       state = AsyncData(response);
//     } catch (e, st) {
//       state = AsyncError(e, st);
//     }
//   }

//   Future<void> loadNextPage() async {
//     if (_isLoadingMore || !_hasMoreData) return;

//     try {
//       _isLoadingMore = true;

//       _currentPage++;

//       final response = await authService.getAssignRequestList(
//         page: _currentPage,
//       );

//       final newList = response.data?.list ?? [];

//       if (newList.isEmpty) {
//         _hasMoreData = false;
//         return;
//       }

//       _fullList.addAll(newList);

//       final updatedData = state.value!;

//       updatedData.data?.list = List.from(_fullList);

//       state = AsyncData(updatedData);

//       if (newList.length < 10) {
//         _hasMoreData = false;
//       }
//     } catch (e) {
//       log("Pagination Error => $e");
//     } finally {
//       _isLoadingMore = false;
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
  int _totalPages = 1;
  bool _isLoadingMore = false;

  final List<ListElement> _fullList = [];

  AssignRequestNotifier(this.authService) : super(const AsyncValue.loading()) {
    getAssignRequests();
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreData => _currentPage < _totalPages;

  Future<void> getAssignRequests({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _totalPages = 1;
        _fullList.clear();

        state = const AsyncValue.loading();
      }

      final response = await authService.getAssignRequestList(
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

      final response = await authService.getAssignRequestList(
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

final getAssignRequestProvider =
    StateNotifierProvider.autoDispose<
      AssignRequestNotifier,
      AsyncValue<GetAssignedRequestsModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);
      return AssignRequestNotifier(authService);
    });
