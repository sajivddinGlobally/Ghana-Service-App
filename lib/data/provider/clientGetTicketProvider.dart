import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/clientGetTicketModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final clientGetTicketProvider =
    FutureProvider.autoDispose<ClientGetTicketModel>((ref) async {
      final service = ref.read(authServiceProvider);
      return await service.clientGetTicket();
    });
