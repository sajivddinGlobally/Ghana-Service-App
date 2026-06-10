// final getCompleteRequestProvider =
//     FutureProvider.autoDispose<GetCompleteRequestsModel>((ref) async {
//       final pendingService = ref.read(authServiceProvider);
//       return await pendingService.getCompleteRequestList();
//     });

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getCompleteRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CompleteRequestNotifier
    extends StateNotifier<AsyncValue<GetCompleteRequestsModel>> {
  final AuthService authService;

  CompleteRequestNotifier(this.authService)
    : super(const AsyncValue.loading()) {
    getCompleteRequests();
  }

  Future<void> getCompleteRequests() async {
    try {
      state = const AsyncValue.loading();

      final response = await authService.getCompleteRequestList();

      state = AsyncValue.data(response);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> refresh() async {
    await getCompleteRequests();
  }
}

final getCompleteRequestProvider =
    StateNotifierProvider.autoDispose<
      CompleteRequestNotifier,
      AsyncValue<GetCompleteRequestsModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);

      return CompleteRequestNotifier(authService);
    });
