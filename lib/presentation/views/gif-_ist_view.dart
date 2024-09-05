import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/count_down_controller.dart';

class GifListView extends StatelessWidget {
  final List<String> gifUrls;

  GifListView({required this.gifUrls});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('GIF List with Countdown'),
      ),
      body: ListView.builder(
        itemCount: gifUrls.length,
        itemBuilder: (context, index) {
          return GifListItem(
            gifUrl: gifUrls[index],
            countdownDuration: 60, // Example countdown duration
          );
        },
      ),
    );
  }
}

class GifListItem extends StatelessWidget {
  final String gifUrl;
  final int countdownDuration;

  GifListItem({required this.gifUrl, required this.countdownDuration});

  @override
  Widget build(BuildContext context) {
    final CountdownController countdownController =
        Get.put(CountdownController(countdownDuration));

    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            // GIF Image (optimized with CachedNetworkImage)
            CachedNetworkImage(
              imageUrl: gifUrl,
              width: 100,
              height: 100,
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error),
            ),
            const SizedBox(width: 16.0),
            // Countdown Timer
            Obx(() {
              return Text(
                '${countdownController.remainingTime.value}s',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              );
            }),
          ],
        ),
      ),
    );
  }
}
