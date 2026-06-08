import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getServiceResModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getServiceProvider = FutureProvider.autoDispose<GetServiceResModel>((
  ref,
) async {
  final service = ref.read(authServiceProvider);
  return await service.getAllService();
});
