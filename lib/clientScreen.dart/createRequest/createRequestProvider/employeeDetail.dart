import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../data/model/getServiceRequestDetailsModel.dart';

final serviceRequestDetailsProvider = FutureProvider.family
    .autoDispose<GetServiceRequestDetailsModel, String>((
      ref,
      serviceRequestId,
    ) async {
      final service = ref.read(authServiceProvider);
      return await service.clientGetServiceRequestDetails(
        serviceRequestId: serviceRequestId,
      );
    });
