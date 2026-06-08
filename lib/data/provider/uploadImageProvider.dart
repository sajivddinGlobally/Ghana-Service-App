import 'dart:developer';
import 'dart:io';
import 'package:dwelleasy_ghana/core/network/api.stateNetwork.dart';
import 'package:dwelleasy_ghana/core/utils/pretty.dio.dart';
import 'package:dwelleasy_ghana/core/utils/showMessage.dart';
import 'package:dwelleasy_ghana/data/model/uploadImageResModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class UploadImageController
    extends StateNotifier<AsyncValue<UploadImageResModel?>> {
  UploadImageController() : super(AsyncValue.data(null));

  Future<bool> uploadImage({
    required File uploadImage,
    required BuildContext context,
  }) async {
    try {
      state = AsyncValue.loading();
      final service = ApiStateNetwork(callDio());
      final response = await service.uploadImage(uploadImage);
      if (response.code == 0 && response.error == false) {
        showSuccessSnackBar( response.message ?? "");
        state = AsyncValue.data(response);
          return true;
      } else {
        showErrorMessage(
          context: context,
          message: response.message ?? "Error",
        );
        state = AsyncValue.data(null);
          return false;
      }
    } catch (e, st) {
      log(e.toString());
      log(st.toString());
      showErrorMessage(context: context, message: e.toString());
      state = AsyncValue.data(null);
                return false;
    }
  }
}

final uploadImageProvider =
    StateNotifierProvider<
      UploadImageController,
      AsyncValue<UploadImageResModel?>
    >((ref) {
      return UploadImageController();
    });
