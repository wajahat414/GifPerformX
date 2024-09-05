import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/gif_list_controller.dart';
import 'components/gif_list_item.dart';

class GifListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GifListController gifListController = Get.find<GifListController>();

    return Scaffold(
      appBar: AppBar(
        title: Text('GIF List with Countdown'),
      ),
      body: Obx(() {
        return ListView.builder(
          itemCount: gifListController.gifUris.length,
          itemBuilder: (context, index) {
            return GifListItem(
              gifUrl: gifListController.gifUris[index],
              index: index,
            );
          },
        );
      }),
    );
  }
}
