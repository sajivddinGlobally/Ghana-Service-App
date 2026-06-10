import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CGetMyPlanRequestModel.dart';
import 'package:riverpod/riverpod.dart';

final getMyPlanRequestProvider =
    FutureProvider.autoDispose<CGetMyPlanRequestModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.clientGetMyPlanRequest();
    });
