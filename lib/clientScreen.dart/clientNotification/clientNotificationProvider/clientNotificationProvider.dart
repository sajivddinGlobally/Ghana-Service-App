import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/clientNotificationModel.dart';
import 'package:dwelleasy_ghana/data/model/readNotificationModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final clientNotificationProvider =
//     FutureProvider.autoDispose<ClientNotificationModel>((ref) async {
//       final service = ref.read(authServiceProvider);
//       return await service.clientGetNotification();
//     });

final clientReadNotificationProvider =
    FutureProvider.autoDispose<ReadNotificationModel>((ref) async {
      final readService = ref.read(authServiceProvider);
      return await readService.clientReadNotification();
    });

/////////////////////////////////////////



class ClientNotificationNotifier
    extends StateNotifier<AsyncValue<ClientNotificationModel>> {
  final AuthService authService;

  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoadingMore = false;

  final List<ListElement> _fullList = [];

  ClientNotificationNotifier(this.authService)
    : super(const AsyncValue.loading()) {
    clientGetNotification();
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreData => _currentPage < _totalPages;

  Future<void> clientGetNotification({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _totalPages = 1;
        _fullList.clear();

        state = const AsyncValue.loading();
      }

      final response = await authService.clientGetNotification(
        page: _currentPage,
      );

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

      final response = await authService.clientGetNotification(
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

final clientNotificationProvider =
    StateNotifierProvider.autoDispose<
      ClientNotificationNotifier,
      AsyncValue<ClientNotificationModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);
      return ClientNotificationNotifier(authService);
    });
