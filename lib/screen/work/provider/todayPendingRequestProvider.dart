import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/todayPendngRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TodayPendingRequestNotifier
    extends StateNotifier<AsyncValue<TodayPendingRequestModel>> {
  final AuthService authService;

  TodayPendingRequestNotifier(this.authService)
    : super(const AsyncValue.loading()) {
    getPendingRequest();
  }

  Future<void> getPendingRequest() async {
    try {
      state = const AsyncValue.loading();

      final response = await authService.todayPendingRequest();

      state = AsyncValue.data(response);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
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









