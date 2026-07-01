import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CGetMyPlanDetailsModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getMyPlanDetailsProvider =
    FutureProvider.autoDispose<CGetMyPlanDetailsModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.clientGetMyPlanDetails();
    });
