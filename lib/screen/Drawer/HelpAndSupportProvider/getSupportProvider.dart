import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getTicketModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getTicketProvider =
    FutureProvider.autoDispose<GetTicketModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.getTicket();
    });