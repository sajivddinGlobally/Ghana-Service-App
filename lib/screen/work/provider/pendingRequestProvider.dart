import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/todayPendngRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class PendingRequestNotifier
    extends StateNotifier<AsyncValue<TodayPendingRequestModel>> {
  final AuthService authService;

  PendingRequestNotifier(this.authService) : super(const AsyncValue.loading()) {
    pendingRequest();
  }

  Future<void> pendingRequest() async {
    try {
      state = const AsyncValue.loading();

      final response = await authService.pendingRequest();

      state = AsyncValue.data(response);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final pendingRequestProvider =
    StateNotifierProvider.autoDispose<
      PendingRequestNotifier,
      AsyncValue<TodayPendingRequestModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);
      return PendingRequestNotifier(authService);
    });
