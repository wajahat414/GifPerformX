import 'package:flutter/material.dart';
import 'package:myapp/domain/models/gif_model.dart';
import 'package:myapp/ui/giff_item_list.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.

  static const List<GifModel> gifList = [
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
    GifModel(
        path: "https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp",
        countdown: 20),
  ];
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'GifPerformX',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const GifItemList(gifs: gifList));
  }
}
