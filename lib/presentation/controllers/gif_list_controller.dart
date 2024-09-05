import 'package:get/get.dart';

import '../../domain/usecases/get_gif_data.dart';

class GifListController extends GetxController {
  final GetGifUris getGifUris;
  var gifUris = <String>[].obs;

  GifListController(this.getGifUris);

  @override
  void onInit() {
    super.onInit();
    fetchGifs();
  }

  void fetchGifs() async {
    final uris = await getGifUris.execute();
    gifUris.value = uris;
  }
}
