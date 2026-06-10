import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getServiceRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getServiceRequestProvider = FutureProvider.family
    .autoDispose<GetServiceRequestModel, String>((ref, status) async {
      final service = ref.read(authServiceProvider);
      return await service.clientGetServiceRequest(status);
    });
