import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getPlanServiceDetailsModel.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getPlanServiceListModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getPlanServiceProvider = FutureProvider<GetPlanServiceListModel>((
  ref,
) async {
  final service = ref.read(authServiceProvider);
  return await service.clientGetPlanService();
});

final getPlanServiceDetailsProvider = FutureProvider.family
    .autoDispose<GetPlanServiceDetailsModel, String>((ref, id) async {
      final planDetailService = ref.read(authServiceProvider);
      return await planDetailService.clientGetPlanServiceDetails(id: id);
    });
