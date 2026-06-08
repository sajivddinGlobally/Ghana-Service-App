import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getAssigneRequestModel.dart';
import 'package:dwelleasy_ghana/data/model/getCompleteRequestModel.dart';
import 'package:dwelleasy_ghana/data/model/getPendingRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAssignRequestProvider =
    FutureProvider.autoDispose<GetAssignedRequestsModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.getAssignRequestList();
    });

final getPendingRequestProvider =
    FutureProvider.autoDispose<GetPendingRequestsModel>((ref) async {
      final pendingService = ref.read(authServiceProvider);
      return await pendingService.getPendingRequestList();
    });


final getCompleteRequestProvider =
    FutureProvider.autoDispose<GetCompleteRequestsModel>((ref) async {
      final pendingService = ref.read(authServiceProvider);
      return await pendingService.getCompleteRequestList();
    });
