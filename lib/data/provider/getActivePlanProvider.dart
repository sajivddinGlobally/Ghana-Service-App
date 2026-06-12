import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getActivePlanModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getActivePlanProvider = FutureProvider.autoDispose<GetActivePlanModel>((
  ref,
) async {
  final serivce = ref.read(authServiceProvider);
  return await serivce.clientGetActivePlan();
});
