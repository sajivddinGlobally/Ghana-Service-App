import 'dart:developer';

import 'package:dwelleasy_ghana/core/apiService/apiService.dart';
import 'package:dwelleasy_ghana/core/apiService/apiServiceProvider.dart';
import 'package:dwelleasy_ghana/data/model/getNotificationModel.dart';
import 'package:dwelleasy_ghana/data/model/readNotificationModel.dart';
import 'package:riverpod/riverpod.dart';

// final getNotificationProvider =
//     FutureProvider.family.autoDispose<GetNotificationModel,int>((ref,page) async {
//       final service = ref.read(authServiceProvider);
//       return await service.getNotification(page: page);
//     });

final readNotiifcationProvider =
    FutureProvider.autoDispose<ReadNotificationModel>((ref) async {
      final readService = ref.read(authServiceProvider);
      return await readService.readNotification();
    });





class NotificationNotifier
    extends StateNotifier<AsyncValue<GetNotificationModel>> {
  final AuthService authService;

  // Pagination को ट्रैक करने के लिए इंटरनल वेरिएबल्स
  int _currentPage = 1;
  int _totalPages = 1;
  bool _isLoadingMore = false;

  // पूरी कंबाइन लिस्ट को स्टोर करने के लिए
  final List<ListElement> _fullList = [];

  NotificationNotifier(this.authService) : super(const AsyncValue.loading()) {
    // पहली बार स्क्रीन ओपन होते ही पहला पेज लोड होगा
    getNotifications();
  }

  // Getter ताकि UI को पता चल सके कि नीचे प्रोग्रेस बार दिखाना है या नहीं
  bool get isLoadingMore => _isLoadingMore;
  bool get hasMoreData => _currentPage < _totalPages;

  // 1. Initial Load या Pull-to-Refresh के लिए फ़ंक्शन
  Future<void> getNotifications({bool isRefresh = false}) async {
    try {
      if (isRefresh) {
        _currentPage = 1;
        _totalPages = 1;
        _fullList.clear();
        // रिफ्रेश करते समय स्क्रीन पर पुराना डेटा न दिखे इसलिए loading स्टेट सेट करते हैं
        state = const AsyncValue.loading();
      }

      final response = await authService.getNotification(page: _currentPage);

      if (response.code == 0 && response.error == false) {
        _totalPages = response.data?.totalPages ?? 1;
        final newList = response.data?.list ?? [];

        _fullList.addAll(newList);

        // यहाँ हम रिस्पॉन्स मॉडल का डेटा अपडेट कर रहे हैं ताकि कंबाइन लिस्ट UI को मिले
        response.data?.list = _fullList;

        state = AsyncValue.data(response);
      } else {
        throw Exception(response.message);
      }
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  // 2. स्क्रॉल करने पर अगला पेज लोड करने के लिए फ़ंक्शन
  Future<void> loadNextPage() async {
    // अगर पहले से लोडिंग चल रही है या सारे पन्ने खत्म हो चुके हैं, तो रुक जाएं
    if (_isLoadingMore || !hasMoreData) return;

    try {
      _isLoadingMore = true;
      _currentPage++;

      // UI को नोटिफाई करने के लिए करंट स्टेट को दोबारा असाइन करते हैं (बॉटम लोडर दिखने के लिए)
      state = AsyncValue.data(state.value!);

      final response = await authService.getNotification(page: _currentPage);

      if (response.code == 0 && response.error == false) {
        final newList = response.data?.list ?? [];
        _fullList.addAll(newList);

        // नयी लिस्ट को पुरानी स्टेट के मॉडल में अपेंड (Merge) कर रहे हैं
        final updatedModel = state.value!;
        updatedModel.data?.list = _fullList;

        state = AsyncValue.data(updatedModel);
      }
    } catch (e, st) {
      log("Load more error: $e");
    } finally {
      _isLoadingMore = false;
      // बॉटम लोडर को छुपाने के लिए स्टेट को दोबारा अपडेट करें
      if (state.hasValue) {
        state = AsyncValue.data(state.value!);
      }
    }
  }
}

//--- Provider Definition ---
final getNotificationProvider =
    StateNotifierProvider.autoDispose<
      NotificationNotifier,
      AsyncValue<GetNotificationModel>
    >((ref) {
      final authService = ref.read(authServiceProvider);
      return NotificationNotifier(authService);
    });
