// Suggested code may be subject to a license. Learn more: ~LicenseLog:4086023091.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:3769038891.
import 'dart:async';

import 'package:flutter/widgets.dart';

class GifItem extends StatelessWidget {
  final String gifUrl;
  final int duration;

  const GifItem({Key? key, required this.gifUrl, required this.duration}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.network(gifUrl),
        Countdown(duration: duration),
      ],
    );
  }
}

class Countdown extends StatefulWidget {
  final int duration;

  const Countdown({Key? key, required this.duration}) : super(key: key);

  @override
  State<Countdown> createState() => _CountdownState();
}

class _CountdownState extends State<Countdown> {
  late int remainingTime;

  @override
  void initState() {
    super.initState();
    remainingTime = widget.duration;
    startTimer();
  }

  void startTimer() {
    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (remainingTime > 0) {
          remainingTime--;
        } else {
          timer.cancel();
        }
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Text('$remainingTime');
  }
}
