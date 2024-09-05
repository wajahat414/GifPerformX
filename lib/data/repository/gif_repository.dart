class GifRepository {
  Future<List<String>> fetchGifUris() async {
    //Simulating a Network Request
    return List.generate(
        1000, (index) => 'https://i.giphy.com/media/Ju7l5y9osyymQ/giphy.webp');
  }
}
