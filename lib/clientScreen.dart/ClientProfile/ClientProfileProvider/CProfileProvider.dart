import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/CProfileModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientProfileProvider = FutureProvider.autoDispose<CProfileModel>((
  ref,
) async {
  final service = ref.read(authServiceProvider);
  return await service.clientGetProfile();
});
