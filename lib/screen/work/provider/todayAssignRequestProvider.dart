// final todayAssignRequestProvider =
//     FutureProvider.autoDispose<TodayAssignRequestModel>((ref) async {
//       final serviceToday = ref.read(authServiceProvider);
//       return await serviceToday.todayAssignRequest();
//     });

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/todayAssignRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodayAssignRequestNotifier
    extends StateNotifier<AsyncValue<TodayAssignRequestModel>> {
  final AuthService authService;

  TodayAssignRequestNotifier(this.authService)
    : super(const AsyncValue.loading()) {
    getTodayAssignRequest();
  }

  Future<void> getTodayAssignRequest() async {
    try {
      state = const AsyncValue.loading();

      final response = await authService.todayAssignRequest();

      state = AsyncValue.data(response);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final todayAssignRequestProvider =
    StateNotifierProvider.autoDispose<
      TodayAssignRequestNotifier,
      AsyncValue<TodayAssignRequestModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);

      return TodayAssignRequestNotifier(authService);
    });
