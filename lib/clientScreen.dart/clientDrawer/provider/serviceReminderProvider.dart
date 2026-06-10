import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/model/serviceReminderResponseModel.dart';

final clientGetServiceRemindersProvider =
    FutureProvider.autoDispose<GetServiceReminderResponseModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.clientGetServiceReminders();
    });

final getMessageProvider =
    FutureProvider.autoDispose<GetServiceReminderResponseModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.getMessage();
    });
