import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'dart:async';

import '../../../event/count_down_event.dart';
import '../../../event/event_bus.dart';

class GifListItem extends StatefulWidget {
  final String gifUrl;
  final int index;

  GifListItem({required this.gifUrl, required this.index});

  @override
  _GifListItemState createState() => _GifListItemState();
}

class _GifListItemState extends State<GifListItem> {
  late StreamSubscription<CountdownEvent> _subscription;
  int _remainingTime = 60; // Initial countdown value

  @override
  void initState() {
    super.initState();
    _subscribeToCountdown();
  }

  @override
  void dispose() {
    _unsubscribeFromCountdown();
    super.dispose();
  }

  void _subscribeToCountdown() {
    // Subscribe to the countdown events for this specific item
    _subscription = EventBus().on<CountdownEvent>().listen((event) {
      if (event.index == widget.index) {
        setState(() {
          _remainingTime = event.remainingTime;
        });
      }
    });
  }

  void _unsubscribeFromCountdown() {
    _subscription.cancel();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // GIF Image (optimized with CachedNetworkImage)
            CachedNetworkImage(
              imageUrl: widget.gifUrl,
              width: 100,
              height: 100,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            const SizedBox(width: 16.0),
            // Countdown Timer
            Text(
              '$_remainingTime s',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
