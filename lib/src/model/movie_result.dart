class MovieResult {

  String title;
  int rank;

  MovieResult.fromJson(Map<String, dynamic> parsedJson) {
    title = parsedJson['title'];
    rank = parsedJson['rank'];
  }
}