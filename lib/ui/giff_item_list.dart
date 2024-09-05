// Suggested code may be subject to a license. Learn more: ~LicenseLog:2993359816.
// Suggested code may be subject to a license. Learn more: ~LicenseLog:1307689299.
import 'package:flutter/material.dart';
import 'package:myapp/domain/models/gif_model.dart';

import 'components/gif_item.dart';

class GifItemList extends StatelessWidget {
  final List<GifModel> gifs;

  const GifItemList({Key? key, required this.gifs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gifs"),
        centerTitle: true,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10.0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemCount: gifs.length,
        itemBuilder: (context, index) {
          return GifItem(
              gifUrl: gifs[index].path, duration: gifs[index].countdown);
        },
      ),
    );
  }
}
