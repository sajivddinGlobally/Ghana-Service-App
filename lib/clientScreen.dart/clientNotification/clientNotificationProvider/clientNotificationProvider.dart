import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/clientNotificationModel.dart';
import 'package:dwelleasy_ghana/data/model/readNotificationModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientNotificationProvider =
    FutureProvider.autoDispose<ClientNotificationModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.clientGetNotification();
    });

final clientReadNotificationProvider =
    FutureProvider.autoDispose<ReadNotificationModel>((ref) async {
      final readService = ref.read(authServiceProvider);
      return await readService.clientReadNotification();
    });
