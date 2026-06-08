import 'package:dio/dio.dart';
import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/network/api.stateNetwork.dart';
import 'package:dwelleasy_ghana/core/utils/pretty.dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final dioProvider = Provider<Dio>((ref) {
  return callDio();
});

final apiProvider = Provider<ApiStateNetwork>((ref) {
  final dio = ref.read(dioProvider);
  return ApiStateNetwork(dio);
});

final authServiceProvider = Provider<AuthService>((ref) {
  final api = ref.read(apiProvider);
  return AuthService(api);
});
