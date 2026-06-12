import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getDashbordCountModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getDashbordCountProvider =
    FutureProvider.autoDispose<GetDashbordCountModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.clientGetDashbordCount();
    });
