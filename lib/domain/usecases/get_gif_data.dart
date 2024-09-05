import '../../data/repository/gif_repository.dart';
import '../models/gif.dart';

class GetGifUris {
  final GifRepository gifRepository;

  GetGifUris(this.gifRepository);

  Future<List<String>> execute() async {
    return await gifRepository.fetchGifUris();
  }
}
