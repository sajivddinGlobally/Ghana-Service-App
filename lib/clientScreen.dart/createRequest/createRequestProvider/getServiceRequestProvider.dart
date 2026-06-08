import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getServiceRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getServiceRequestProvider =
    FutureProvider.autoDispose<GetServiceRequestModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.clientGetServiceRequest();
    });
