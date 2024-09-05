import 'package:get/get.dart';

import 'dart:async';

import '../../event/count_down_event.dart';
import '../../event/event_bus.dart';

class CountdownController extends GetxController {
  Timer? _timer;
  int countdownValue = 60;

  @override
  void onInit() {
    super.onInit();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      countdownValue--;

      for (int i = 0; i < 1000; i++) {
        EventBus().publish(CountdownEvent(i, countdownValue));
      }

      if (countdownValue == 0) {
        timer.cancel();
      }
    });
  }

  @override
  void onClose() {
    _timer?.cancel();
    super.onClose();
  }
}
