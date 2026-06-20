import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getNotificationModel.dart';
import 'package:dwelleasy_ghana/data/model/readNotificationModel.dart';
import 'package:riverpod/riverpod.dart';

// final getNotificationProvider =
//     FutureProvider.family.autoDispose<GetNotificationModel,int>((ref,page) async {
//       final service = ref.read(authServiceProvider);
//       return await service.getNotification(page: page);
//     });

final readNotiifcationProvider =
    FutureProvider.autoDispose<ReadNotificationModel>((ref) async {
      final readService = ref.read(authServiceProvider);
      return await readService.readNotification();
    });

class NotificationNotifier
    extends StateNotifier<AsyncValue<GetNotificationModel>> {
  final AuthService authService;

  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoadingMore = false;

  final List<ListElement> _fullList = [];

  NotificationNotifier(this.authService) : super(const AsyncValue.loading()) {
    getNotifications();
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreData => _currentPage < _totalPages;

  Future<void> getNotifications({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _totalPages = 1;
        _fullList.clear();

        state = const AsyncValue.loading();
      }

      final response = await authService.getNotification(page: _currentPage);

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

      final response = await authService.getNotification(page: _currentPage);

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

//--- Provider Definition ---
final getNotificationProvider =
    StateNotifierProvider.autoDispose<
      NotificationNotifier,
      AsyncValue<GetNotificationModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);
      return NotificationNotifier(authService);
    });
