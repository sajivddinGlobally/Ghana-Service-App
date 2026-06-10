import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getAssigneRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final getAssignRequestProvider =
//     FutureProvider.autoDispose<GetAssignedRequestsModel>((ref) async {
//       final service = ref.read(authServiceProvider);
//       return await service.getAssignRequestList();
//     });

class AssignRequestNotifier
    extends StateNotifier<AsyncValue<GetAssignedRequestsModel>> {
  final AuthService authService;

  AssignRequestNotifier(this.authService) : super(const AsyncValue.loading()) {
    getAssignRequests();
  }

  Future<void> getAssignRequests() async {
    try {
      state = const AsyncValue.loading();

      final response = await authService.getAssignRequestList();

      state = AsyncValue.data(response);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
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
