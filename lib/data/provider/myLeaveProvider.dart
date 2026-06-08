import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getMyLeaveModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final leaveRequestProvider = FutureProvider.autoDispose<GetMyLeaveModel>((
  ref,
) async {
  final api = ref.read(authServiceProvider);
  return api.fetchAllLeave();
});
