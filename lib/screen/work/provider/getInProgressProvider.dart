import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getAssigneRequestModel.dart';
import 'package:dwelleasy_ghana/data/model/inProgressModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class InProgressRequestNotifier
    extends StateNotifier<AsyncValue<InProgressModel>> {
  final AuthService authService;

  InProgressRequestNotifier(this.authService)
    : super(const AsyncValue.loading()) {
    getInProgressRequest();
  }

  Future<void> getInProgressRequest() async {
    try {
      state = const AsyncValue.loading();

      final response = await authService.getInProgress();

      state = AsyncValue.data(response);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final getInProgressProvider =
    StateNotifierProvider.autoDispose<
      InProgressRequestNotifier,
      AsyncValue<InProgressModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);

      return InProgressRequestNotifier(authService);
    });
