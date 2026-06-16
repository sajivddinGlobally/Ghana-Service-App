import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CGetPlanModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientGetOurProvider = FutureProvider.autoDispose<CgetPlanModel>((
  ref,
) async {
  final service = ref.read(authServiceProvider);
  return await service.clientGetPlan();
});
