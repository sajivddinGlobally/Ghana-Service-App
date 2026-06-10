import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getNotificationModel.dart';
import 'package:riverpod/riverpod.dart';

final getNotificationProvider =
    FutureProvider.autoDispose<GetNotificationModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.getNotification();
    });
