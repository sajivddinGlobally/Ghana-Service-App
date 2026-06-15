import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getServiceRequestModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// final getServiceRequestProvider = FutureProvider.family
//     .autoDispose<GetServiceRequestModel, String>((ref, status) async {
//       final service = ref.read(authServiceProvider);
//       return await service.clientGetServiceRequest(status);
//     });

class ClientGetServiceRequestNotifier
    extends StateNotifier<AsyncValue<GetServiceRequestModel>> {
  final AuthService authService;
  final String status;

  int _currentPage = 1;
  bool _isLoadingMore = false;
  bool _hasMoreData = true;

  final List<ListElement> _fullList = [];

  ClientGetServiceRequestNotifier(this.authService, this.status)
    : super(const AsyncLoading()) {
    clientGetTicket();
  }

  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreData => _hasMoreData;

  Future<void> clientGetTicket({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _hasMoreData = true;
        _fullList.clear();

        state = const AsyncLoading();
      }

      final response = await authService.clientGetServiceRequest(
        page: _currentPage,
        status: status,
      );

      final newList = response.data?.list ?? [];

      _fullList.addAll(newList);

      response.data?.list = List.from(_fullList);

      _hasMoreData = newList.isNotEmpty && newList.length >= 10;

      state = AsyncData(response);
    } catch (e, st) {
      state = AsyncError(e, st);
    }
  }

  Future<void> loadNextPage() async {
    if (_isLoadingMore || !_hasMoreData) return;

    try {
      _isLoadingMore = true;

      _currentPage++;

      final response = await authService.clientGetServiceRequest(
        page: _currentPage,
        status: status,
      );

      final newList = response.data?.list ?? [];

      if (newList.isEmpty) {
        _hasMoreData = false;
        return;
      }

      _fullList.addAll(newList);

      final updatedData = state.value!;

      updatedData.data?.list = List.from(_fullList);

      state = AsyncData(updatedData);

      if (newList.length < 10) {
        _hasMoreData = false;
      }
    } catch (e) {
      log("Pagination Error => $e");
    } finally {
      _isLoadingMore = false;
    }
  }
}

final getServiceRequestProvider = StateNotifierProvider.autoDispose
    .family<
      ClientGetServiceRequestNotifier,
      AsyncValue<GetServiceRequestModel>,
      String
    >((ref, status) {
      final authService = ref.read(authServiceProvider);

      return ClientGetServiceRequestNotifier(authService, status);
    });
