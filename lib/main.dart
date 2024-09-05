import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'presentation/views/gif-list_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> gifUrls = List.generate(
        1000, (index) => 'https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp');

    return GetMaterialApp(
      title: 'GIF List with Countdown',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: GifListView(gifUrls: gifUrls),
    );
  }
}
