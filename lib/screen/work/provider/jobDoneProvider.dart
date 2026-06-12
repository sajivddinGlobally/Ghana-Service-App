import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/jobDoneModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final jobDoneProvider = FutureProvider.autoDispose<JobDoneModel>((ref) async {
  final jobDoneService = ref.read(authServiceProvider);
  return await jobDoneService.jobDone();
});
