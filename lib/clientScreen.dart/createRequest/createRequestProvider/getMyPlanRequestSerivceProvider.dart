import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getMyPlanRequestServiceModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getMyPlanRequestServiceProvider =
    FutureProvider.autoDispose<GetMyPlanRequestServiceModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.clientGetMyPlanRequestService();
    });
