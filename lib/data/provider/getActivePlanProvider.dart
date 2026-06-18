import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getActivePlanModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final getActivePlanProvider = FutureProvider.autoDispose<GetActivePlanModel>((
//   ref,
// ) async {
//   final serivce = ref.read(authServiceProvider);
//   return await serivce.clientGetActivePlan();
// });

class ActivePlanNotifier extends StateNotifier<AsyncValue<GetActivePlanModel>> {
  final AuthService authService;

  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;

  final List<ListElement> _fullList = [];

  ActivePlanNotifier(this.authService) : super(const AsyncLoading()) {
    getActivePlan();
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreData => _hasMoreData;

  Future<void> getActivePlan({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _hasMoreData = true;
        _fullList.clear();

        state = const AsyncLoading();
      }

      final response = await authService.clientGetActivePlan(
        page: _currentPage,
      );

      final newList = response.data?.list ?? [];

      _fullList.addAll(newList);

      response.data?.list = List.from(_fullList);

      _hasMoreData = newList.isNotEmpty && newList.length >= 10;

      state = AsyncData(response);
    } catch (e, st) {
      log(st.toString());
      state = AsyncError(e, st);
    }
  }

  Future<void> loadNextPage() async {
    if (_isLoadingMore || !_hasMoreData) return;

    try {
      _isLoadingMore = true;

      _currentPage++;

      final response = await authService.clientGetActivePlan(
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

final getActivePlanProvider =
    StateNotifierProvider.autoDispose<
      ActivePlanNotifier,
      AsyncValue<GetActivePlanModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);

      return ActivePlanNotifier(authService);
    });
