import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getAssignCountModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getAssignCountProvider = FutureProvider.autoDispose<GetAssignCount>((
  ref,
) async {
  final coutService = ref.read(authServiceProvider);
  return await coutService.getAssignCount();
});
