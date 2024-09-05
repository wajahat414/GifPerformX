import 'package:get/get.dart';

class CountdownController extends GetxController {
  final int duration; // countdown duration in seconds
  RxInt remainingTime; // observable for remaining time

  CountdownController(this.duration) : remainingTime = duration.obs;

  @override
  void onInit() {
    super.onInit();
    startCountdown();
  }

  void startCountdown() {
    Future.doWhile(() async {
      await Future.delayed(Duration(seconds: 1));
      if (remainingTime.value > 0) {
        remainingTime.value--;
        return true;
      }
      return false;
    });
  }
}
