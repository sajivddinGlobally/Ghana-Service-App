// import 'dart:developer';

// import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
// import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
// import 'package:dwelleasy_ghana/data/ClientModel/CGetMyPlanRequestModel.dart';
// import 'package:riverpod/riverpod.dart';

// class MyPlanRequestNotifier
//     extends StateNotifier<AsyncValue<CGetMyPlanRequestModel>> {
//   final AuthService authService;

//   int _currentPage = 1;
//   bool _isLoadingMore = false;
//   bool _hasMoreData = true;

//   final List<ListElement> _fullList = [];

//   MyPlanRequestNotifier(this.authService) : super(const AsyncLoading()) {
//     getMyPlanRequests();
//   }

//   bool get isLoadingMore => _isLoadingMore;
//   bool get hasMoreData => _hasMoreData;

//   Future<void> getMyPlanRequests({bool isRefresh = false}) async {
//     try {
//       if (isRefresh) {
//         _currentPage = 1;
//         _hasMoreData = true;
//         _fullList.clear();

//         state = const AsyncLoading();
//       }

//       final response = await authService.clientGetMyPlanRequest(
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

//       final response = await authService.clientGetMyPlanRequest(
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

//   Future<void> refresh() async {
//     await getMyPlanRequests(isRefresh: true);
//   }
// }

// final myPlanRequestProvider =
//     StateNotifierProvider.autoDispose<
//       MyPlanRequestNotifier,
//       AsyncValue<CGetMyPlanRequestModel>
//     >((ref) {
//       final authService = ref.read(authServiceProvider);

//       return MyPlanRequestNotifier(authService);
//     });

import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CGetMyPlanRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MyPlanRequestNotifier
    extends StateNotifier<AsyncValue<CGetMyPlanRequestModel>> {
  final AuthService authService;

  MyPlanRequestNotifier(this.authService) : super(const AsyncLoading()) {
    getMyPlanRequests();
  }

  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;

  final List<ListElement> _fullList = [];

  bool get hasMoreData => _hasMoreData;
  bool get isLoadingMore => _isLoadingMore;

  Future<void> getMyPlanRequests({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _hasMoreData = true;
        _fullList.clear();
      }

      final response = await authService.clientGetMyPlanRequest(
        page: _currentPage,
      );

      final newList = response.data?.list ?? [];

      _fullList.clear();
      _fullList.addAll(newList);

      response.data?.list = List.from(_fullList);

      final totalPages = response.data?.totalPages ?? 1;
      _hasMoreData = _currentPage < totalPages;

      state = AsyncData(response);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> loadNextPage() async {
    if (_isLoadingMore || !_hasMoreData) return;

    _isLoadingMore = true;

    try {
      _currentPage++;

      final response = await authService.clientGetMyPlanRequest(
        page: _currentPage,
      );

      final newList = response.data?.list ?? [];

      /// Duplicate remove
      for (final item in newList) {
        if (!_fullList.any((e) => e.id == item.id)) {
          _fullList.add(item);
        }
      }

      final updated = response;

      updated.data?.list = List.from(_fullList);

      final totalPages = response.data?.totalPages ?? 1;
      _hasMoreData = _currentPage < totalPages;

      state = AsyncData(updated);
    } catch (e) {
      log(e.toString());
    } finally {
      _isLoadingMore = false;
    }
  }

  Future<void> refresh() async {
    await getMyPlanRequests(isRefresh: true);
  }
}

final myPlanRequestProvider =
    StateNotifierProvider.autoDispose<
      MyPlanRequestNotifier,
      AsyncValue<CGetMyPlanRequestModel>
    >((ref) {
      return MyPlanRequestNotifier(ref.read(authServiceProvider));
    });
