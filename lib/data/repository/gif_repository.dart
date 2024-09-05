class GifRepository {
  Future<List<String>> fetchGifUris() async {
    //Simulating a Network Request
    return List.generate(1000, (index) => 'https://example.com/gif_$index.gif');
  }
}
