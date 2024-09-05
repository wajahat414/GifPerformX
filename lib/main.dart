import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'data/repository/gif_repository.dart';
import 'domain/usecases/get_gif_data.dart';
import 'presentation/controllers/count_down_controller.dart';
import 'presentation/controllers/gif_list_controller.dart';
import 'presentation/views/gif_list_view.dart';

void main() {
  // Initialize dependencies before starting the app
  setupDependencies();

  runApp(MyApp());
}

void setupDependencies() {
  // Seting  up EventBus and GetX dependencies here
  Get.put(GifRepository()); // Data layer dependency
  Get.put(GetGifUris(Get.find<GifRepository>())); // Domain layer dependency
  Get.put(GifListController(
      Get.find<GetGifUris>())); // Presentation layer dependency
  Get.put(CountdownController()); // Countdown event publisher
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GIF List with Countdown',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GifListView(), // Starting the app with the GIF List view
    );
  }
}
