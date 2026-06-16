import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/serviceRequestDetailModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serviceRequestDetailsProvider = FutureProvider.family
    .autoDispose<ServiceRequestDetailModel, String>((ref, requestId) async {
      final serivce = ref.read(authServiceProvider);
      return serivce.serviceRequestDetails(requestId: requestId);
    });
