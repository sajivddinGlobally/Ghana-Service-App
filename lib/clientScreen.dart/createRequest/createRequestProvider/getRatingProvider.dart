import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/ClientModel/getRatingModel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final getRatingProvider = FutureProvider.family
    .autoDispose<GetRatingModel, String>((ref, requestId) async {
      final ratingService = ref.read(authServiceProvider);
      return await ratingService.clientGetRating(requstId: requestId);
    });
