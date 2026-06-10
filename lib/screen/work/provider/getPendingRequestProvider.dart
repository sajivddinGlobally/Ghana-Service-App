import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getPendingRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPendingRequestProvider =
    FutureProvider.autoDispose<GetPendingRequestsModel>((ref) async {
      final pendingService = ref.read(authServiceProvider);
      return await pendingService.getPendingRequestList();
    });
