import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getProfileModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getProfileProvider = FutureProvider.autoDispose<GetProfileModel>((
  ref,
) async {
  final authService = ref.read(authServiceProvider);
  return await authService.getProfile();
});
